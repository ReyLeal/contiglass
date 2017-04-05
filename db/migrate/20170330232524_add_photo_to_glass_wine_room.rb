class AddPhotoToGlassWineRoom < ActiveRecord::Migration[5.0]
  def change
    add_column :glass_wine_rooms, :glass_photo_id, :integer
  end
end
