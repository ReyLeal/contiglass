class AddPhotoToGlassPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :glass_photos, :photo_id, :integer
  end
end
