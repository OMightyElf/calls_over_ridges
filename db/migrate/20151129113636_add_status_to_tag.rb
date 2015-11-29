class AddStatusToTag < ActiveRecord::Migration
  def change
  	add_column :tags, :status, :integer
  end
end
