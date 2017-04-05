class AddPhotoToGlassShowerDoor < ActiveRecord::Migration[5.0]
  def change
    add_column :glass_shower_doors, :glass_photo_id, :integer
  end
end
