class CreateGlassWindowsDoors < ActiveRecord::Migration[5.0]
  def change
    create_table :glass_windows_doors do |t|
      t.references :glass_photos, foreign_key: true

      t.timestamps
    end
  end
end
