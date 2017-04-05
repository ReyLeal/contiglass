class AddPhotoToGlassWindowsDoor < ActiveRecord::Migration[5.0]
  def change
    add_column :glass_windows_doors, :glass_photo_id, :integer
  end
end
