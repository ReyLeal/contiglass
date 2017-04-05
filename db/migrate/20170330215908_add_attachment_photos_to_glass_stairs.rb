class AddAttachmentPhotosToGlassStairs < ActiveRecord::Migration
  def self.up
    change_table :glass_stairs do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :glass_stairs, :photos
  end
end
