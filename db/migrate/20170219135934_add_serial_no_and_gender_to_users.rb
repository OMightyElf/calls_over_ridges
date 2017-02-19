class AddSerialNoAndGenderToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :serial_number, :string
  	add_column :users, :gender, :integer
  end
end
