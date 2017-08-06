ActiveAdmin.register User do
	permit_params :serial_number, :name, :email, :password, :password_confirmation, :role, :gender, :phone_number,
								:zipcode, :address, :receipt_url, :support_date, :support_start, :support_end, :paid_at, :receipt_state,
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

	preserve_default_filters!
	filter :sign_in_count

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
					row :serial_number
					row :name
					row :gender
					row :email
					row :role do |user|
						I18n.t("enum.user.role.#{user.role}")
					end
					row :phone_number
					row :zipcode
					row :address
					row :support_start
					row :support_end
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
					row :sign_in_count
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
		column :serial_number
		column :name
		column :gender
		column :email
		column :role do |user|
			I18n.t("enum.user.role.#{user.role}")
		end
		column :phone_number
		column :zipcode
		column :address
		column :money
		column :paid_at
		column :support_start
		column :support_end
		column :need_receipt
		column :receipt_url
		column :payment_info
		column :receipt_state do |user|
			I18n.t("enum.user.receipt_state.#{user.receipt_state}")
		end
		column :current_state do |user|
			I18n.t("enum.user.current_state.#{user.current_state}")
		end
		column :sign_in_count
		actions defaults: true
	end


	form do |f|
		f.inputs do
			f.semantic_errors *f.object.errors.keys
			f.input :serial_number
			f.input :name
			f.hidden_field :password, value: '12345678' unless f.object.persisted?
			f.hidden_field :password_confirmation, value: '12345678' unless f.object.persisted?
			f.input :gender, as: :radio, collection: User.genders.keys, include_blank: false
			f.input :email
			f.input :role, as: :select, collection: User.role_attributes_for_select, include_blank: false
			f.input :phone_number
			f.input :zipcode
			f.input :address
			f.input :money
			f.input :support_start, as: :date_picker
			f.input :support_end, as: :date_picker
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
