ActiveAdmin.register Tag do
  permit_params :name_zh, :name_en

  controller do
    def scoped_collection
      Tag.includes(:posts)
    end
  end

  index do
    column :id
    column :name_zh
    column :name_en
    column :posts do |tag|
      table_for tag.posts.last(5) do
        column do |post|
          link_to post.title, [:admin, post]
        end
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name_zh
      f.input :name_en
    end
    f.actions
  end
end
