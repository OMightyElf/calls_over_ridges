ActiveAdmin.register_page "Mass Import Photos" do


  page_action :confirm_update, method: :post do
    # binding.remote_pry
    # redirect_to admin_calendar_path, notice: "Your event was added"
  end

	content do 
		render "mass_import_photos"
	end

end