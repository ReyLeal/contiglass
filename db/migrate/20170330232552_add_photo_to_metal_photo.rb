class AddPhotoToMetalPhoto < ActiveRecord::Migration[5.0]
  def change
    add_column :metal_photos, :photo_id, :integer
  end
end
