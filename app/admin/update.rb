ActiveAdmin.register Update do
	permit_params :update_time, :current_school, :current_grade, :attendence_rate, :reading_report_amount, :grade, :family_income, :weight, :height, :study_hours, :child_id

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
					row :update_time
					row :current_school
					row :current_grade
					row :attendence_rate
					row :reading_report_amount
					row :grade
					row :family_income
					row :weight
					row :height
					row :study_hours
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
		column :update_time
		column :current_school
		column :current_grade
		column :attendence_rate
		column :reading_report_amount
		column :grade
		column :family_income
		column :weight
		column :height
		column :study_hours
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
			f.input :update_time
			f.input :current_school
			f.input :current_grade
			f.input :attendence_rate
			f.input :reading_report_amount
			f.input :grade
			f.input :family_income
			f.input :weight
			f.input :height
			f.input :study_hours
		end
		f.actions
	end

end
