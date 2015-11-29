class AddTypeToTag < ActiveRecord::Migration
  def change
  	add_column :tags, :tag_type, :integer
  end
end
