class AddAttachmentPhotosToGlassFloors < ActiveRecord::Migration
  def self.up
    change_table :glass_floors do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :glass_floors, :photos
  end
end
