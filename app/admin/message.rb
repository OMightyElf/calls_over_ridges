ActiveAdmin.register Message do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
permit_params do
	permitted = [:target, :picture, :content, :user_id]
	permitted
end

controller do
	def scoped_collection
		Message.all.includes(:user)
	end
end

show do
	columns do
		column span: 7 do
			h1 "訊息匣"
			attributes_table do
				row :target
				row :picture
				row :content
				row :user do |message|
					table_for message.user do
						column do |user|
							link_to user.name, admin_user_path(user)
						end
					end
				end
				row :created_at
			end
		end
	end
end

index do
	column :target
	column :picture
	column :content
	column '來自' do |message|
		link_to message.user.name, admin_user_path(message.user)
	end
	column :created_at
	actions defaults: true
end

form do |f|
	f.inputs do
		f.semantic_errors *f.object.errors.keys
		f.input :target
		f.input :picture
		f.input :content
		f.input :user, as: :select2, collection: User.all, member_label: Proc.new { |u| u.name }
	end
	f.actions
end
end
