ActiveAdmin.register_page "Mass Import Supporter Data" do
  menu false

  page_action :import, title: "匯入資助人資料", method: :post do
    path = params[:file].path
    update_list_parsed = Roo::Spreadsheet.open(path)
    @raw_list = update_list_parsed.sheet(0)
    Rails.cache.write("/import_supporter_data/#{Date.today.to_s}",path)
  end

  page_action :confirm_import, title: "確認匯入", method: :get do
    path = Rails.cache.fetch("/import_supporter_data/#{Date.today.to_s}");
    update_list_parsed = Roo::Spreadsheet.open(path)
    @raw_list = update_list_parsed.sheet(0)
    @success_list = []
    @failed_list = []

    (2..@raw_list.last_row).each do |i|
      row = @raw_list.row(i)
      user = User.find_or_initialize_by(serial_number: row[0])
      user.name = row[1]
      if row[2] == '女'
        user.gender = :female
      else
        user.gender = :male
      end
      user.email = row[3]
      user.role = :supporter
      user.phone_number = row[4]
      user.zipcode = row[5]
      user.address = row[6]
      user.money = row[7]
      user.paid_at = row[8]
      if row[9] == '是'
        user.need_receipt = true
      else
        user.need_receipt = false
      end
      user.password = '12345678'
      user.password_confirmation = '12345678'
      if user.save
        @success_list.push(row)
      else
        @failed_list.push({ row: row, error: user.errors.full_messages.join(', ')})
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

  content title: "匯入資助者資料" do
    render "mass_update"
  end


end
