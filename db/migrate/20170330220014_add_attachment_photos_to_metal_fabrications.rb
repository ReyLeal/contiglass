class AddAttachmentPhotosToMetalFabrications < ActiveRecord::Migration
  def self.up
    change_table :metal_fabrications do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :metal_fabrications, :photos
  end
end
