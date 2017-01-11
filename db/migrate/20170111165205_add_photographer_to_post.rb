class AddPhotographerToPost < ActiveRecord::Migration
  def change
  	add_column :posts, :photographer, :string
  end
end
