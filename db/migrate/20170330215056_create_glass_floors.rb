class CreateGlassFloors < ActiveRecord::Migration[5.0]
  def change
    create_table :glass_floors do |t|
      t.references :glass_photos, foreign_key: true

      t.timestamps
    end
  end
end
