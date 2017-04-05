class AddAttachmentPhotoToOtherGlassStructures < ActiveRecord::Migration
  def self.up
    change_table :other_glass_structures do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :other_glass_structures, :photo
  end
end
