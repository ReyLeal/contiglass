class CreateGlassShowerDoors < ActiveRecord::Migration[5.0]
  def change
    create_table :glass_shower_doors do |t|
      t.references :glass_photos, foreign_key: true

      t.timestamps
    end
  end
end
