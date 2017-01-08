ActiveAdmin.register Child do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	permit_params do
		permitted = [:name, :serial_number, :gender, :birthday, :school, :school_year, :supported_at, :support_until, :supporter_id]
		permitted
	end

	controller do
		def scoped_collection
			Child.all.includes(:user)
		end
	end

	filter :gender, as: :select, collection: Child.genders

	show do
		columns do
			column span: 4 do
				h1 "孩童檢視"
				attributes_table  do
					row :name
					row :serial_number
					row :gender
					row :birthday
					row :school
					row :school_year
					row :supported_at
					row :support_until
					row :user do |child|
						table_for child.user do
							column do |user|
								link_to user.name, admin_user_path(user)
							end
						end
					end
				end
			end
		end
	end

	index do
		column :name
		column :serial_number
		column :gender
		column :birthday
		column :school
		column :school_year
		column :supported_at
		column :support_until
		column :supporter_id
		actions defaults: true
	end

	form do |f|
		f.inputs do
			f.semantic_errors *f.object.errors.keys
			f.input :name
			f.input :serial_number
			f.input :gender, as: :select, collection: Child.genders.keys
			f.input :birthday, as: :datetime_picker
			f.input :school
			f.input :school_year
			f.input :supported_at, as: :date_picker
			f.input :support_until, as: :date_picker
			f.input :user, as: :select2, collection: User.all, member_label: Proc.new { |u| u.name }
		end

		f.has_many :updates, header: "月更新資料" do |update|
			update.input :month
			update.input :year
			update.input :attendence_rate
			update.input :reading_report_amount
			update.input :grade
			update.input :family_income
			update.input :weight
			update.input :height
			update.input :reading_time
		end
		f.actions
	end
end
