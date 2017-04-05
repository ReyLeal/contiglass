class AddPhotoToGlassElevator < ActiveRecord::Migration[5.0]
  def change
    add_column :glass_elevators, :glass_photo_id, :integer
  end
end
