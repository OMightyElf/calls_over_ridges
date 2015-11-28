module ApplicationHelper
	def setactive(page, id)
		(params[:action] == page && params[:id].to_s == id.to_s) ? "active" : nil
		
		# binding.pry
	end
end
