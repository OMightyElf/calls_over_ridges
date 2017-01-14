class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def set_admin_locale
    I18n.locale = "zh-TW"
  end

  def after_sign_in_path_for(resource)
    if resource.supporter?
      session["user_return_to"] = resource.children.blank? ? user_path(id: resource.id) : children_path(resource.children.first)
    else
      session["user_return_to"] = admin_root_path
    end
  end

  def authenticate_admin!
    session[:user_return_to] = request.fullpath # devise stored_location session name

    if !user_signed_in?
      redirect_to new_user_session_path, notice: "請先登入"
      # raise_404("User Not Signed In in authenticate_admin!")
    elsif !current_user.try(:admin?)
      redirect_to root_path, notice: "權限不足無法進入"
    end
  end
end
