# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

SEED_MANIFEST_PATH = Rails.root.join('db', 'seed_images.json').freeze

def content_type_for(filename)
	ext = File.extname(filename).downcase
	return 'image/jpeg' if ext == '.jpg' || ext == '.jpeg'
	return 'image/png' if ext == '.png'
	return 'image/gif' if ext == '.gif'
	return 'image/webp' if ext == '.webp'
	'application/octet-stream'
end

def s3_base_url
	bucket = ENV['S3_BUCKET'] || ENV['S3_BUCKET_NAME']
	region = ENV['S3_REGION'] || ENV['AWS_REGION'] || ENV['AWS_DEFAULT_REGION']

	return nil if bucket.to_s.strip.empty?

	if region.to_s.strip.empty? || region == 'us-east-1'
		"https://#{bucket}.s3.amazonaws.com"
	else
		"https://#{bucket}.s3.#{region}.amazonaws.com"
	end
end

def extract_id_from_key(key)
	# Example key:
	#   glass_railings/photos/000/000/024/original/railing24.jpg
	# id_partition = 000/000/024 -> id = 24
	parts = key.split('/')
	photos_idx = parts.index('photos')
	raise "Unexpected key (missing /photos/): #{key}" unless photos_idx

	id_partition = parts[(photos_idx + 1)..(photos_idx + 3)]
	raise "Unexpected key (missing id partition): #{key}" unless id_partition&.length == 3

	id_partition.join.to_i
end

def load_seed_manifest_keys
	return nil unless SEED_MANIFEST_PATH.exist?

	data = JSON.parse(SEED_MANIFEST_PATH.read)
	keys = data.is_a?(Hash) ? data['keys'] : nil
	keys.is_a?(Array) ? keys : nil
rescue JSON::ParserError => e
	raise "Invalid JSON in #{SEED_MANIFEST_PATH}: #{e.message}"
end

def ensure_sequence_reset!(model_class)
	# On Postgres this prevents future inserts colliding when we create explicit IDs.
	ActiveRecord::Base.connection.reset_pk_sequence!(model_class.table_name)
rescue NoMethodError
	# reset_pk_sequence! may not exist for some adapters; safe to ignore.
end

def seed_attachment_records_from_manifest!(keys:, model_class:, folder_prefix:, group_foreign_key: nil, group_id: nil)
	created = 0
	now = Time.current
	column_names = model_class.column_names

	prefix = folder_prefix.end_with?('/') ? folder_prefix : "#{folder_prefix}/"

	# Use only the `original` variant as the canonical source; Paperclip will generate URLs
	# for `thumb`/`medium` based on `id` and `photos_file_name`.
	filtered = keys.select { |k| k.start_with?(prefix) && k.include?('/original/') }
	filtered.sort.each do |key|
		next if key.end_with?('/')

		id = extract_id_from_key(key)
		filename = key.split('/').last

		attrs = {
			id: id,
			photos_file_name: filename,
			photos_content_type: content_type_for(filename),
			photos_updated_at: now
		}
		if group_foreign_key && group_id
			attrs[group_foreign_key.to_sym] = group_id
		end

		attrs.select! { |k, _| column_names.include?(k.to_s) }

		record = model_class.find_by(id: id) || model_class.new
		record.assign_attributes(attrs)
		record.save!(validate: false)
		created += 1
	end

	ensure_sequence_reset!(model_class)
	created
end

ActiveRecord::Base.transaction do
	Rails.logger.info('Seeding: wiping existing gallery records…')

	# Delete leaf tables first.
	[
		AllPhoto,
		GlassElevator,
		GlassFloor,
		GlassRailing,
		GlassShowerDoor,
		GlassStair,
		GlassWindowsDoor,
		GlassWineRoom,
		MetalFabrication,
		MetalRailing,
		OtherGlassStructure
	].each do |klass|
		klass.delete_all
		ensure_sequence_reset!(klass)
	end

	GlassPhoto.delete_all
	MetalPhoto.delete_all
	Photo.delete_all
	[GlassPhoto, MetalPhoto, Photo].each { |klass| ensure_sequence_reset!(klass) }

	Rails.logger.info('Seeding: creating root grouping records…')

	root_photo = Photo.create!(job_name: 'seed')
	glass_group = GlassPhoto.create!(photo: root_photo)
	metal_group = MetalPhoto.create!(photo: root_photo)

	keys = load_seed_manifest_keys
	unless keys
		raise "Seed manifest missing at #{SEED_MANIFEST_PATH}. This file must be present in the deployed image to seed the DB."
	end
	Rails.logger.info("Seeding from manifest: #{SEED_MANIFEST_PATH} (#{keys.length} keys)")

	if (base = s3_base_url)
		Rails.logger.info("S3 base URL (https): #{base}")
	else
		Rails.logger.warn("S3 bucket/region env vars not found; Paperclip will still build URLs from its config.")
	end

	counts = {}

	counts[:all_photos] = seed_attachment_records_from_manifest!(
		keys: keys,
		model_class: AllPhoto,
		folder_prefix: 'all_photos',
		group_foreign_key: :photo_id,
		group_id: root_photo.id
	)

	[
		[GlassElevator, 'glass_elevators'],
		[GlassFloor, 'glass_floors'],
		[GlassRailing, 'glass_railings'],
		[GlassShowerDoor, 'glass_shower_doors'],
		[GlassStair, 'glass_stairs'],
		[GlassWindowsDoor, 'glass_windows_doors'],
		[GlassWineRoom, 'glass_wine_rooms'],
		[OtherGlassStructure, 'other_glass_structures']
	].each do |klass, folder|
		counts[folder.to_sym] = seed_attachment_records_from_manifest!(
			keys: keys,
			model_class: klass,
			folder_prefix: folder,
			group_foreign_key: :glass_photo_id,
			group_id: glass_group.id
		)
	end

	[
		[MetalFabrication, 'metal_fabrications'],
		[MetalRailing, 'metal_railings']
	].each do |klass, folder|
		counts[folder.to_sym] = seed_attachment_records_from_manifest!(
			keys: keys,
			model_class: klass,
			folder_prefix: folder,
			group_foreign_key: :metal_photo_id,
			group_id: metal_group.id
		)
	end

	Rails.logger.info("Seeding complete. Inserted: #{counts.sort_by { |k, _| k.to_s }.map { |k, v| "#{k}=#{v}" }.join(', ')}")
end
