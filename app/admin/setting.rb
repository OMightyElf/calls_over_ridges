ActiveAdmin.register Setting do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
	permit_params do
		permitted = [:var, :value]
		permitted
	end

	controller do
		def scoped_collection
			Setting.get_all
		end
	end

	filter :gender, as: :select, collection: Child.genders

	show do
		columns do
			column span: 4 do
				h1 "設定"
				attributes_table  do
					row :var
					row :value
				end
			end
		end
	end

	index do
		column :var
		column :value
	end

	form do |f|
		f.inputs do
			f.semantic_errors *f.object.errors.keys
			f.input :var
			f.input :value
		end

		f.actions
	end
end
