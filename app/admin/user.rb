ActiveAdmin.register User do
	permit_params :name, :email, :password, :password_confirmation, :role, :phone_number, :address, :receipt_url, :support_batch, :support_year, :paid_at, :current_receipt_state,
								:child_ids, children_attributes: [:id, :supporter_id]


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
      User.all.includes(:children)
    end
  end


	show do
		columns do
			column span: 4 do
				h1 "資助者檢視"
				attributes_table  do
					row :name
					row :email
					row :role
					row :phone_number
					row :address
					row :receipt_url
					row :support_batch
					row :support_year
					row :paid_at
					row :current_receipt_state
					row :children do |user|
						table_for user.children do
							column do |child|
								link_to child.name, admin_child_path(child)
							end
						end
					end
				end
			end
		end
	end

	index do
		column :name
		column :email
		column :role
		column :phone_number
		column :address
		column :receipt_url
		column :support_batch
		column :support_year
		column :paid_at
		column :current_receipt_state
		actions defaults: true
	end


	form do |f|
		f.inputs do
			f.semantic_errors *f.object.errors.keys
			f.input :name
			f.hidden_field :password, value: f.object.password || Devise.friendly_token.first(8)
			f.input :email
			f.input :role, as: :select, collection: User.role_attributes_for_select, include_blank: false
			f.input :phone_number
			f.input :address
			f.input :receipt_url
			f.input :support_batch
			f.input :support_year
			f.input :paid_at, as: :date_picker
			f.input :current_receipt_state
		end
		f.actions
	end

end
