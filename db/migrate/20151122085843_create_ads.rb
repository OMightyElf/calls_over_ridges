class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.string :cover
      t.string :title
      t.string :url
      t.integer :click_count

      t.timestamps null: false
    end
  end
end
