ActiveAdmin.register_page "Mass Import Videos" do
  menu false

  page_action :confirm_update, method: :post do
    videos = params[:videos]
    params_year = (params[:year_and_month])[/\d+/]
    params_month = (params[:year_and_month])[/\/(\d+)/,1]
    @failed_list = []
    @success_list = []

    videos.each do |video|
      filename = video.original_filename
      child_serial_number = filename[/(\d+)_/,1] #哪個小孩的影片
      # num_of_video = filename[/_(\d+)/,1] #他的第幾張

      if child = Child.find_by_serial_number(child_serial_number)
        last_update = child.updates.find_by(update_year: params_year, update_month: params_month)

        if last_update.present?
          last_update.video = video
          last_update.save
          @success_list.push(video.original_filename)
        else
          @failed_list.push(video.original_filename)
        end
      else
        @failed_list.push(video.original_filename)
      end
    end if videos
  end

  page_action :import, method: :get do
    @years_and_months = Update.all.map{|u| "#{u.update_year}/#{u.update_month}" }.uniq
  end
end
