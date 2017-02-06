ActiveAdmin.register_page "Mass Import Money Granting Proof" do
  menu false

  page_action :confirm_update, method: :post do
    photos = params[:photos]
    @update_time = params[:year_and_month]
    params_year = (params[:year_and_month])[/\d+/]
    params_month = (params[:year_and_month])[/\/(\d+)/,1]
    @failed_list = []
    @success_list = []
    @children_list = []
    @failed_children_list = []

    photos.each do |photo|
      filename = photo.original_filename
      school_number = filename[/(\d+)/,1] # 哪個學校的
      children = Child.where("serial_number LIKE ?", "#{school_number}%")
      updates = Update.where(update_year: params_year, update_month: params_month, child_id: children)
      @success_list.push(photo.original_filename)

      updates.each do |update|
        update.money_granting_proof = photo
        if update.save
          child = children.find(update.child_id)
          @children_list.push("#{child.name} ##{child.serial_number}")
        else
          @failed_children_list.push(update.child_id)
        end
      end
    end if photos
  end

  page_action :import, method: :get do
    @years_and_months = Update.all.map{|u| "#{u.update_year}/#{u.update_month}" }.uniq
  end
end