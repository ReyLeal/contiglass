class AddPhotoToMetalRailing < ActiveRecord::Migration[5.0]
  def change
    add_column :metal_railings, :metal_photo_id, :integer
  end
end
