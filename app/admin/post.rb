ActiveAdmin.register Post do
	permit_params :user_id,
								:title,
								:subtitle,
								:author,
								:content,
								:status,
								:pinned,
								:category,
								:file_type,
								:publish_date,
								:cover,
								:cover_cache,
								:video,
								:video_cache,
								:photographer

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

  index do |post|
  	column :id
  	column :file_type do |post|
  	  I18n.t("enum.post.file_type.#{post.file_type}")
  	end
  	column :user_id
  	column :title
  	column :subtitle
  	column :author
  	column :photographer
  	column :status
  	column :category
  	column :publish_date
  	column :cover do |post|
  	  post.cover.url("thumb")
  	end
  	column :video do |post|
  	  post.video.url
  	end
  	column :pinned
  	actions default: true
  end


	show do
		columns do
			column span: 4 do
				h1 "文章檢視"
				attributes_table  do
					row :id
					row :user_id
					row :file_type
					row :title
					row :subtitle
					row :author
					row :photographer
					row :status
					row :category
					row :publish_date
					row :pinned
					row :cover do |post|
						image_tag post.cover.url('small')
					end
					row :video do |post|
					  video_tag post.video.url
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
			f.input :user_id, as: :select, collection: User.admin, member_label: Proc.new { |x| "#{x.name}(#{x.email})" }, include_blank: false
			f.inputs "文章圖片", multipart: true do
			  f.input :cover, as: :file, hint: f.object.cover.present? \
			    ? image_tag(f.object.cover.url(:thumb))
			    : content_tag(:span, "no cover page yet")
			  f.input :cover_cache, as: :hidden
			end
			f.inputs "文章影片", multipart: true do
			  f.input :video, as: :file, hint: f.object.video.present? \
			    ? video_tag(f.object.video.url)
			    : content_tag(:span, "no video page yet")
			end
			f.input :file_type, as: :radio, collection: Post.file_types.keys
			f.input :pinned
			f.input :title
			f.input :subtitle
			f.input :author
			f.input :photographer
			f.input :content, as: :ckeditor, input_html: { ckeditor: { height: 300 } }
			f.input :status, as: :select, collection: Post.status_attributes_for_select, include_blank: false
			f.input :category, as: :select, collection: Post.category.options, include_blank: false
			f.input :publish_date, as: :date_picker, input_html: { value: Date.today }
		end
		f.actions
	end

end
