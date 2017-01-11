module ApplicationHelper
	def setactive(page, name_en)
		(params[:action] == page && params[:name_en].to_s == name_en.to_s) ? "active" : nil
	end

	def inline_background_image(url, default: nil)
	  image_url = url || default
	  return unless image_url.present?
	  "background-image: url(#{image_url})"
	end
end
