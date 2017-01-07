class AddChildIdToUpdate < ActiveRecord::Migration
  def change
    add_column :updates, :child_id, :integer
  end
end
