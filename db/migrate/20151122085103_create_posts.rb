class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer  :user_id
      t.string   :title
      t.string   :subtitle
      t.text     :content
      t.integer  :status, default: 0
      t.datetime :publish_date
      t.string   :cover
      t.string   :video
      t.string   :author
      t.integer  :view_count, default: 0
      t.string   :category
      t.timestamps null: false
    end
  end
end
