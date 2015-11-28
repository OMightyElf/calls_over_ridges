ActiveAdmin.register Post do
	permit_params :title, :content, :summary, :cover, post_tags_attributes: [:id, :post_id, :tag_id]

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
      Post.all.includes(:tags)
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
					row :summary
					row :cover do |project|
						image_tag project.cover.url
					end
					row :content do |project|
						raw(project.content)
					end
					row :tag do |project|
						table_for project.tags do
							column do |tag|
								link_to tag.name_zh
							end
						end
					end
				end
			end
		end
	end


	form do |f|
		f.inputs do
			f.input :user_id, as: :select, collection: User.all, member_label: Proc.new { |x| "#{x.author_name}(#{x.email})" }, include_blank: false
			f.input :title
			f.input :summary
			f.input :content
			f.input :status, as: :select, collection: Post.status_attributes_for_select, include_blank: false
			f.has_many :post_tags, header: "文章類別" do |tif|
			  tif.input :tag, as: :select, collection: Tag.all, member_label: Proc.new { |t| "#{t.name_zh}" }, include_blank: false
			end
			# f.input :post_tags, label: "文章類別", as: :check_boxes, collection: Tag.all, member_label: Proc.new { |a| "#{a.name_zh}" }
			f.input :publish_date, as: :date_picker
			f.input :cover
		end
		f.actions
	end

end
