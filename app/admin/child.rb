ActiveAdmin.register Child do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	permit_params do
		permitted = [:name, :serial_number, :gender, :birthday, :supported_at, :support_until, :supporter_id,
									updates_attributes: [
										# 沒有加id的話每次更新就會重創物件
										:id, :update_year, :update_month, :current_school, :current_grade, :attendence_rate,
										:reading_report_amount, :grade, :family_income, :weight,
										:height, :study_hours, :comment]]
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
					row :supported_at
					row :support_until
					row :user do |child|
						table_for child.user do
							column do |user|
								link_to user.name, admin_user_path(user) if child.user
							end
						end
					end
				end
			end
			column span: 8 do
				h1 "更新資料"
				child.updates.each do |update|
					attributes_table do
						row :update_year do
							update.update_year
						end
						row :update_month do
							update.update_month
						end
						row :current_school do
							update.current_school
						end
						row :current_grade do
							update.current_grade
						end
						row :attendence_rate do
							update.attendence_rate
						end
						row :reading_report_amount do
							update.reading_report_amount
						end
						row :grade do
							update.grade
						end
						row :family_income do
							update.family_income
						end
						row :weight do
							update.weight
						end
						row :height do
							update.height
						end
						row :study_hours do
							update.study_hours
						end
						row :created_at do
							update.created_at
						end
						row :updated_at do
							update.updated_at
						end
						row :support_proof do
							image_tag(update.support_proof.url)
						end
						row :money_granting_proof do
							image_tag(update.money_granting_proof.url)
						end
						row 'photos' do
							safe_join update.photos.map { |p| image_tag(p.picture.url) }
						end
						row :video do
							video_tag(update.video.url)
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
			f.input :gender, as: :select, collection: Child.genders.keys, include_blank: false
			f.input :birthday, as: :date_picker
			f.input :supported_at, as: :date_picker
			f.input :support_until, as: :date_picker
			f.input :user, as: :select2, collection: User.all, member_label: Proc.new { |u| u.name }
			f.has_many :updates, header: "月更新資料" do |update|
				update.input :update_year
				update.input :update_month
				update.input :current_school
				update.input :current_grade
				update.input :attendence_rate
				update.input :reading_report_amount
				update.input :grade
				update.input :family_income
				update.input :weight
				update.input :height
				update.input :study_hours
				update.input :comment
			end
		end

		f.actions
	end
end
