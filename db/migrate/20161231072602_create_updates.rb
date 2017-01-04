class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
    	t.integer  :month
    	t.integer  :year
    	t.float    :attendence_rate
    	t.integer  :reading_report_amount
    	t.integer  :grade
    	t.integer  :family_income
    	t.float    :weight
    	t.float    :height
    	t.float    :reading_time

      t.timestamps null: false
    end
  end
end
