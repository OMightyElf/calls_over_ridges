module ApplicationHelper
	def setactive(page, name_en)
		(params[:action] == page && params[:name_en].to_s == name_en.to_s) ? "active" : nil
	end
end
