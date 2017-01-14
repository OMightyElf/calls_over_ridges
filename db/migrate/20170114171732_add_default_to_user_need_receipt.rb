class AddDefaultToUserNeedReceipt < ActiveRecord::Migration
  def change
  	change_column :users, :need_receipt, :boolean, default: true
  end
end
