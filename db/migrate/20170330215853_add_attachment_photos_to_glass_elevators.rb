class AddAttachmentPhotosToGlassElevators < ActiveRecord::Migration
  def self.up
    change_table :glass_elevators do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :glass_elevators, :photos
  end
end
