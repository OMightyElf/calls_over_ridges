class ChangePhotoColumnToMoneyGranting < ActiveRecord::Migration
  def change
  	remove_column :updates, :photo, :string, array: true
  	add_column :updates, :money_granting_proof, :string
  end
end
