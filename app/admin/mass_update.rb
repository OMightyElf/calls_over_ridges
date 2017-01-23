ActiveAdmin.register_page "Mass Update" do
  menu priority: 5, label: "匯入每月更新"

  page_action :import, title: "匯入每月更新", method: :post do
    path = params[:file].path
    update_list_parsed = Roo::Spreadsheet.open(path)
    @raw_list = update_list_parsed.sheet(0)
    Rails.cache.write("/import_update/#{Date.today.to_s}",path)
  end

  page_action :confirm_import, title: "確認匯入", method: :get do
    path = Rails.cache.fetch("/import_update/#{Date.today.to_s}");
    update_list_parsed = Roo::Spreadsheet.open(path)
    @raw_list = update_list_parsed.sheet(0)

    (2..@raw_list.last_row).each do |i|
      row = @raw_list.row(i)
      child = Children.find_by_serial_num((row[0]).to_i)
      if child != nil
        u = Update.new
        u.update_time = Time.now
        u.attendance_rate = row[6].to_f  #attendance rate
        u.reading_report_amount = row[7].to_i #reading reports
        u.grade = row[8].to_i #grade
        u.family_income = row[9].to_i #family incone
        u.weight = row[10].to_f #height
        u.height = row[11].to_f #weight
        u.study_hours = row[12].to_i #daily study hr
        u.comment = row[13]
        u.save
      end
    end
  end

  # def email_list_file
  #   path = params[:file].path
  #   email_file_parsed = Roo::Spreadsheet.open(path)
  #   raw_list = email_file_parsed.sheet(0).column(1)

  #   respond_to do |format|
  #     format.js { render :action => "email_form" }
  #   end
  # end

  content title: "匯入每月更新" do
    render "mass_update"
  end


end