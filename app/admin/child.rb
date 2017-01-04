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


end
