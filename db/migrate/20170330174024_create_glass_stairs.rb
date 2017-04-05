class CreateGlassStairs < ActiveRecord::Migration[5.0]
  def change
    create_table :glass_stairs do |t|
      t.string :photo_file_name
      t.references :glass_photos, foreign_key: true

      t.timestamps
    end
  end
end
