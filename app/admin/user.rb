ActiveAdmin.register User do
	permit_params :name, :email, :password, :password_confirmation, :role, :phone_number,
								:zipcode, :address, :receipt_url, :support_date, :paid_at, :receipt_state,
								:need_receipt, :current_state, :money,
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
					row :role do |user|
						I18n.t("enum.user.role.#{user.role}")
					end
					row :phone_number
					row :zipcode
					row :address
					row :money
					row :paid_at
					row :need_receipt
					row :receipt_url do |user|
						image_tag user.receipt_url.url
					end
					row :payment_info
					row :receipt_state do |user|
						I18n.t("enum.user.receipt_state.#{user.receipt_state}")
					end
					row :current_state do |user|
						I18n.t("enum.user.current_state.#{user.current_state}")
					end
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
		column :role do |user|
			I18n.t("enum.user.role.#{user.role}")
		end
		column :phone_number
		column :zipcode
		column :address
		column :money
		column :paid_at
		column :need_receipt
		column :receipt_url
		column :payment_info
		column :receipt_state do |user|
			I18n.t("enum.user.receipt_state.#{user.receipt_state}")
		end
		column :current_state do |user|
			I18n.t("enum.user.current_state.#{user.current_state}")
		end
		actions defaults: true
	end


	form do |f|
		f.inputs do
			f.semantic_errors *f.object.errors.keys
			f.input :name
			f.input :email
			f.input :role, as: :select, collection: User.role_attributes_for_select, include_blank: false
			f.input :phone_number
			f.input :zipcode
			f.input :address
			f.input :money
			f.input :paid_at, as: :date_picker
			f.input :need_receipt, as: :boolean
			f.input :receipt_state, as: :radio, collection: User.receipt_states.keys, include_blank: false
			f.input :receipt_url
			f.input :payment_info
			f.input :current_state, as: :radio, collection: User.current_states.keys, include_blank: false
		end
		f.actions
	end

end
