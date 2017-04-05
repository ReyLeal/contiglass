class AddPhotoToMetalFabrication < ActiveRecord::Migration[5.0]
  def change
    add_column :metal_fabrications, :metal_photo_id, :integer
  end
end
