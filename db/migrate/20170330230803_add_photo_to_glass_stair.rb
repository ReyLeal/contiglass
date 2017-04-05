class AddPhotoToGlassStair < ActiveRecord::Migration[5.0]
  def change
    add_column :glass_stairs, :glass_photo_id, :integer
  end
end
