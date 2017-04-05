class CreateMetalPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :metal_photos do |t|
      t.string :photo_file_name
      t.references :photos, foreign_key: true

      t.timestamps
    end
  end
end
