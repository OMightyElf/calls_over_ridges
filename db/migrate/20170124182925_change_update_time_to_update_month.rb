class ChangeUpdateTimeToUpdateMonth < ActiveRecord::Migration
  def change
    remove_column :updates, :update_time, :datetime
    add_column :updates, :update_year, :integer
    add_column :updates, :update_month, :integer
  end
end
