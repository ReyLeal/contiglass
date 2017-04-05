class AddPhotoToAllPhotos < ActiveRecord::Migration[5.0]
  def change
    add_column :all_photos, :photo_id, :integer
  end
end
