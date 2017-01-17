class AddFileTypeToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :file_type, :integer, default: 0
  end
end
