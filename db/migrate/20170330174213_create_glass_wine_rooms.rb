class CreateGlassWineRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :glass_wine_rooms do |t|
      t.string :photo_file_name
      t.references :glass_photos, foreign_key: true

      t.timestamps
    end
  end
end
