class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
    	t.string     :name
    	t.string     :serial_number
    	t.integer    :gender
    	t.datetime   :supported_at
    	t.datetime   :support_until
    	t.integer    :supporter_id

      t.timestamps null: false
    end
  end
end
