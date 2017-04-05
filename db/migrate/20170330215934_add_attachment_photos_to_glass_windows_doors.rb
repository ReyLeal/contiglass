class AddAttachmentPhotosToGlassWindowsDoors < ActiveRecord::Migration
  def self.up
    change_table :glass_windows_doors do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :glass_windows_doors, :photos
  end
end
