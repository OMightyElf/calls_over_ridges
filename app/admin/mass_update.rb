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
      child = Child.find_by_serial_number((row[2]).to_i)
      if child.present?
        u = child.updates.where(update_year: row[0], update_month: row[1]).first.presence || child.updates.new
        u.update_year = row[0]
        u.update_month = row[1]
        u.current_school = row[3]
        u.current_grade = row[4]
        u.attendence_rate = row[5].to_f/100  #attendance rate
        u.reading_report_amount = row[6].to_i #reading reports
        u.grade = row[7].to_i #grade
        u.family_income = row[8].to_i #family incone
        u.height = row[9].to_f #weight
        u.weight = row[10].to_f #height
        u.study_hours = row[11].to_i #daily study hr
        u.comment = row[12]
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
