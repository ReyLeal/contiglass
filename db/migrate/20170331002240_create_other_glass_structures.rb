class CreateOtherGlassStructures < ActiveRecord::Migration[5.0]
  def change
    create_table :other_glass_structures do |t|
      t.references :glass_photo, foreign_key: true

      t.timestamps
    end
  end
end
