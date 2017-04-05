class CreateGlassPhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :glass_photos do |t|
      t.string :photo_file_name
      t.references :photos, foreign_key: true

      t.timestamps
    end
  end
end
