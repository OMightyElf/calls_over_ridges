ActiveAdmin.register User do
	permit_params :email, :role, :phone_number, :address, :receipt_url, :support_batch, :support_year, :paid_at, :current_receipt_state


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

	filter :gender, as: :select, collection: User.genders

  controller do
    def scoped_collection
      User.all.includes(:children)
    end
  end


	show do
		columns do
			column span: 4 do
				h1 "使用者檢視"
				attributes_table  do
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
								link_to child, child
							end
						end
					end
				end
			end
		end
	end

	index do
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
			f.input :email
			f.input :role
			f.input :phone_number
			f.input :address
			f.input :receipt_url
			f.input :support_batch
			f.input :support_year
			f.input :paid_at, as: :date_picker
			f.input :current_receipt_state
			# f.has_many :children, header: "資助小孩" do |ch|
			#   ch.input :child, as: :select, collection: Child.all, member_label: Proc.new { |t| "#{t.name}" }, include_blank: false
			# end
		end
		f.actions
	end

end
