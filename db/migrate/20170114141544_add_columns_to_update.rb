class AddColumnsToUpdate < ActiveRecord::Migration
  def change
  	add_column :updates, :current_school, :string
  	add_column :updates, :current_grade, :string
  end
end
