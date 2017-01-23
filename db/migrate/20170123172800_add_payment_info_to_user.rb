class AddPaymentInfoToUser < ActiveRecord::Migration
  def change
  	add_column :users, :payment_info, :text
  end
end
