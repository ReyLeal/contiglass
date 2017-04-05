class AddPhotoToGlassRailing < ActiveRecord::Migration[5.0]
  def change
    add_column :glass_railings, :glass_photo_id, :integer
  end
end
