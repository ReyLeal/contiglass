class AddColumnsToEmail < ActiveRecord::Migration[5.0]
  def change
    add_column :emails, :name, :string
    add_column :emails, :email, :string
    add_column :emails, :content, :string
  end
end
