class AddAttachmentPhotosToGlassRailings < ActiveRecord::Migration
  def self.up
    change_table :glass_railings do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :glass_railings, :photos
  end
end
