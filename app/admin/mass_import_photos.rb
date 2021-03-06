ActiveAdmin.register_page "Mass Import Photos" do
  menu false

  page_action :confirm_update, method: :post do
    photos = params[:photos]
    @update_time = params[:year_and_month]
    params_year = (params[:year_and_month])[/\d+/]
    params_month = (params[:year_and_month])[/\/(\d+)/,1]
    @failed_list = []
    @success_list = []

    photos.each do |photo|
      filename = photo.original_filename
      child_serial_number = filename[/(\w+)-/,1] #哪個小孩的照片
      num_of_photo = filename[/-(\w+)/,1] #他的第幾張

      if child = Child.find_by_serial_number(child_serial_number)
        last_update = child.updates.find_by(update_year: params_year, update_month: params_month)

        if last_update.present?
          ph = last_update.photos.find_or_initialize_by(serial_number: num_of_photo)
          ph.picture = photo
          ph.save
          @success_list.push(photo.original_filename)
        else
          @failed_list.push("#{photo.original_filename} 無更新資料")
        end
      else
        @failed_list.push("#{photo.original_filename} 查無此孩童")
      end
    end if photos
  end

  page_action :import, method: :get do
    @years_and_months = Update.all.map{|u| "#{u.update_year}/#{u.update_month}" }.uniq
  end
end
