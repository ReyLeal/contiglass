class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :job_name
      t.string :photo_file

      t.timestamps
    end
  end
end
