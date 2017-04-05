class AddAttachmentPhotosToMetalRailings < ActiveRecord::Migration
  def self.up
    change_table :metal_railings do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :metal_railings, :photos
  end
end
