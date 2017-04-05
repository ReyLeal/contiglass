class AddAttachmentPhotosToGlassShowerDoors < ActiveRecord::Migration
  def self.up
    change_table :glass_shower_doors do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :glass_shower_doors, :photos
  end
end
