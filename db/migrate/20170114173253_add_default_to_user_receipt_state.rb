class AddDefaultToUserReceiptState < ActiveRecord::Migration
  def change
  	change_column :users, :receipt_state, 'integer USING CAST(receipt_state AS integer)', default: 0
  end
end
