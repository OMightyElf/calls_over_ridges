ActiveAdmin.register Update do
	permit_params :month, :year, :attendence_rate, :reading_report_amount, :grade, :family_income, :weight, :height, :reading_time, :child_id

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
      Update.all.includes(:child)
    end
  end


	show do
		columns do
			column span: 4 do
				h1 "月更新資料"
				attributes_table  do
					row :month
					row :year
					row :attendence_rate
					row :reading_report_amount
					row :grade
					row :family_income
					row :weight
					row :height
					row :reading_time
					row :created_at
					row :updated_at
					row :child do |update|
						table_for update.child do
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
		column :month
		column :year
		column :attendence_rate
		column :reading_report_amount
		column :grade
		column :family_income
		column :weight
		column :height
		column :reading_time
		column :created_at
		column :updated_at
		column :child do |update|
			table_for update.child do
				column do |child|
					link_to child.name, admin_child_path(child)
				end
			end
		end
		actions defaults: true
	end


	form do |f|
		f.inputs do
			f.semantic_errors *f.object.errors.keys

			f.input :child, as: :select2, collection: Child.all, include_blank: false
			f.input :month
			f.input :year
			f.input :attendence_rate
			f.input :reading_report_amount
			f.input :grade
			f.input :family_income
			f.input :weight
			f.input :height
			f.input :reading_time
		end
		f.actions
	end

end
