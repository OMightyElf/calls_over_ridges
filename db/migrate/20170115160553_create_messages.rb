class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.integer :target, default: 0
    	t.string :picture
    	t.text :content
    	t.integer :user_id
      t.timestamps null: false
    end
  end
end
