class CreateMetalFabrications < ActiveRecord::Migration[5.0]
  def change
    create_table :metal_fabrications do |t|
      t.string :photo_file_name
      t.references :metal_photos, foreign_key: true

      t.timestamps
    end
  end
end
