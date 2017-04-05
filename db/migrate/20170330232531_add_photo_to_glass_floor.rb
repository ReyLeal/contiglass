class AddPhotoToGlassFloor < ActiveRecord::Migration[5.0]
  def change
    add_column :glass_floors, :glass_photo_id, :integer
  end
end
