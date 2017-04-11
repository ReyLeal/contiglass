# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170411180641) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "all_photos", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "photo_id"
    t.index ["photos_id"], name: "index_all_photos_on_photos_id", using: :btree
  end

  create_table "emails", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "name"
    t.string   "email"
    t.string   "content"
  end

  create_table "glass_elevators", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "glass_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "glass_photo_id"
    t.index ["glass_photos_id"], name: "index_glass_elevators_on_glass_photos_id", using: :btree
  end

  create_table "glass_floors", force: :cascade do |t|
    t.integer  "glass_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "glass_photo_id"
    t.index ["glass_photos_id"], name: "index_glass_floors_on_glass_photos_id", using: :btree
  end

  create_table "glass_photos", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "photos_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "photo_id"
    t.index ["photos_id"], name: "index_glass_photos_on_photos_id", using: :btree
  end

  create_table "glass_railings", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "glass_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "glass_photo_id"
    t.index ["glass_photos_id"], name: "index_glass_railings_on_glass_photos_id", using: :btree
  end

  create_table "glass_shower_doors", force: :cascade do |t|
    t.integer  "glass_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "glass_photo_id"
    t.index ["glass_photos_id"], name: "index_glass_shower_doors_on_glass_photos_id", using: :btree
  end

  create_table "glass_stairs", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "glass_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "glass_photo_id"
    t.index ["glass_photos_id"], name: "index_glass_stairs_on_glass_photos_id", using: :btree
  end

  create_table "glass_windows_doors", force: :cascade do |t|
    t.integer  "glass_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "glass_photo_id"
    t.index ["glass_photos_id"], name: "index_glass_windows_doors_on_glass_photos_id", using: :btree
  end

  create_table "glass_wine_rooms", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "glass_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "glass_photo_id"
    t.index ["glass_photos_id"], name: "index_glass_wine_rooms_on_glass_photos_id", using: :btree
  end

  create_table "metal_fabrications", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "metal_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "metal_photo_id"
    t.index ["metal_photos_id"], name: "index_metal_fabrications_on_metal_photos_id", using: :btree
  end

  create_table "metal_photos", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "photos_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "photo_id"
    t.index ["photos_id"], name: "index_metal_photos_on_photos_id", using: :btree
  end

  create_table "metal_railings", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "metal_photos_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.integer  "metal_photo_id"
    t.index ["metal_photos_id"], name: "index_metal_railings_on_metal_photos_id", using: :btree
  end

  create_table "other_glass_structures", force: :cascade do |t|
    t.integer  "glass_photo_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "photos_file_name"
    t.string   "photos_content_type"
    t.integer  "photos_file_size"
    t.datetime "photos_updated_at"
    t.index ["glass_photo_id"], name: "index_other_glass_structures_on_glass_photo_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.string   "job_name"
    t.string   "photo_file"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "waterjet_fabrications", force: :cascade do |t|
    t.string   "photo_file_name"
    t.integer  "metal_photos_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["metal_photos_id"], name: "index_waterjet_fabrications_on_metal_photos_id", using: :btree
  end

  add_foreign_key "all_photos", "photos", column: "photos_id"
  add_foreign_key "glass_elevators", "glass_photos", column: "glass_photos_id"
  add_foreign_key "glass_floors", "glass_photos", column: "glass_photos_id"
  add_foreign_key "glass_photos", "photos", column: "photos_id"
  add_foreign_key "glass_railings", "glass_photos", column: "glass_photos_id"
  add_foreign_key "glass_shower_doors", "glass_photos", column: "glass_photos_id"
  add_foreign_key "glass_stairs", "glass_photos", column: "glass_photos_id"
  add_foreign_key "glass_windows_doors", "glass_photos", column: "glass_photos_id"
  add_foreign_key "glass_wine_rooms", "glass_photos", column: "glass_photos_id"
  add_foreign_key "metal_fabrications", "metal_photos", column: "metal_photos_id"
  add_foreign_key "metal_photos", "photos", column: "photos_id"
  add_foreign_key "metal_railings", "metal_photos", column: "metal_photos_id"
  add_foreign_key "other_glass_structures", "glass_photos"
  add_foreign_key "waterjet_fabrications", "metal_photos", column: "metal_photos_id"
end
