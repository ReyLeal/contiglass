class AddAttachmentPhotosToGlassWineRooms < ActiveRecord::Migration
  def self.up
    change_table :glass_wine_rooms do |t|
      t.attachment :photos
    end
  end

  def self.down
    remove_attachment :glass_wine_rooms, :photos
  end
end
