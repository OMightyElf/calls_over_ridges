class AddUserColumns < ActiveRecord::Migration
  def change
    add_column :users, :summary, :text
    add_column :users, :author_name, :string
    add_column :users, :role, :integer
  end
end
