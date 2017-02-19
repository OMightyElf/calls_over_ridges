ActiveAdmin.register_page "Mass Import Children Data" do
  menu false

  page_action :import, title: "匯入孩童資料", method: :post do
    path = params[:file].path
    update_list_parsed = Roo::Spreadsheet.open(path)
    @raw_list = update_list_parsed.sheet(0)
    Rails.cache.write("/import_children_data/#{Date.today.to_s}",path)
  end

  page_action :confirm_import, title: "確認匯入", method: :get do
    path = Rails.cache.fetch("/import_children_data/#{Date.today.to_s}");
    update_list_parsed = Roo::Spreadsheet.open(path)
    @raw_list = update_list_parsed.sheet(0)
    @success_list = []
    @failed_list = []

    (2..@raw_list.last_row).each do |i|
      row = @raw_list.row(i)
      child = Child.find_or_initialize_by(serial_number: row[0].to_s)
      child.name = [row[1], row[2]].join(' ')
      if row[3] == '女'
        child.gender = :female
      else
        child.gender = :male
      end
      child.birthday = row[4]
      if child.save
        @success_list.push(row)
      else
        @failed_list.push({ row: row, error: child.errors.full_messages.join(', ')})
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
