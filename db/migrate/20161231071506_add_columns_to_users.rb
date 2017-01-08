class AddColumnsToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :phone_number, :string
  	add_column :users, :address, :string
  	add_column :users, :zipcode, :string
  	add_column :users, :receipt_url, :string
  	add_column :users, :support_date, :datetime
  	add_column :users, :need_receipt, :boolean
  	add_column :users, :paid_at, :datetime
  	add_column :users, :receipt_state, :integer
  	add_column :users, :current_state, :integer
  	add_column :users, :money, :integer
  end
end
