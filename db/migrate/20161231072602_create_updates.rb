class CreateUpdates < ActiveRecord::Migration
  def change
    create_table :updates do |t|
    	t.datetime :update_time
    	t.float    :attendence_rate
    	t.integer  :reading_report_amount
    	t.integer  :grade
    	t.integer  :family_income
    	t.float    :weight
    	t.float    :height
      t.float    :study_hours
      t.text     :comment
      t.string   :support_proof
      t.array    :photo, default: []
      t.string   :video

      t.timestamps null: false
    end
  end
end