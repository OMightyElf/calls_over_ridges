ActiveAdmin.register Post do
	permit_params :user_id, :title, :subtitle, :author, :content, :status, :category, :publish_date, :cover

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

  controller do
    def scoped_collection
      Post.all
    end
  end

  index as: :grid do |post|
  	link_to admin_post_path(post), class: 'post-grid' do
  		content_tag :div do
		  	image_tag(post.cover.url(:thumb)) +
		  	content_tag(:h5, post.title)
		  end
	  end
  end


	show do
		columns do
			column span: 4 do
				h1 "文章檢視"
				attributes_table  do
					row :id
					row :user_id
					row :title
					row :subtitle
					row :author
					row :status
					row :category
					row :publish_date
					row :cover do |post|
						image_tag post.cover.url
					end
					row :content do |post|
						raw(post.content)
					end
				end
			end
		end
	end


	form do |f|
		f.inputs do
			# t.string   :cover
			# t.string   :video
			f.inputs "文章圖片", multipart: true do
			  f.input :cover, as: :file, hint: f.object.cover.present? \
			    ? image_tag(f.object.cover.url(:thumb))
			    : f.template.content_tag(:span, "no cover page yet")
			  f.input :cover_cache, as: :hidden
			end
			f.input :user_id, as: :select, collection: User.all, member_label: Proc.new { |x| "#{x.name}(#{x.email})" }, include_blank: false
			f.input :title
			f.input :subtitle
			f.input :author
			f.input :content
			f.input :status, as: :select, collection: Post.status_attributes_for_select, include_blank: false
			f.input :category, as: :select, collection: Post.category.options, include_blank: false
			f.input :publish_date, as: :date_picker
		end
		f.actions
	end

end
