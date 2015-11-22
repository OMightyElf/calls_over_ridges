class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer  :user_id
      t.string   :title
      t.string   :summary
      t.text     :content
      t.integer  :status
      t.datetime :publish_date
      t.string   :cover
      t.integer  :view_count
      t.timestamps null: false
    end
  end
end
