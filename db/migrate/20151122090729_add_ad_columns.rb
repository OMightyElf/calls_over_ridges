class AddAdColumns < ActiveRecord::Migration
  def change
    add_column :ads, :start_time, :datetime
    add_column :ads, :end_time, :datetime
    add_column :ads, :status, :integer
  end
end
