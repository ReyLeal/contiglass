class AddAttachmentPhotosToAllPhotos < ActiveRecord::Migration
  def self.up
    change_table :all_photos do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :all_photos, :photos
  end
end
