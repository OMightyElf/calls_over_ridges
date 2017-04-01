class AddSupportTimeColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :support_start, :datetime
    add_column :users, :support_end, :datetime
    remove_column :children, :supported_at, :datetime
    remove_column :children, :support_until, :datetime
  end
end
