class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_hot_and_latest

  def set_admin_locale
    I18n.locale = "zh-TW"
  end

  def set_hot_and_latest
    @hot_posts = Post.all.order(view_count: :desc)
  end

  def authenticate_admin!
    session[:user_return_to] = request.fullpath # devise stored_location session name

    if !user_signed_in?
      redirect_to new_user_session_path, error: "請先登入"
      # raise_404("User Not Signed In in authenticate_admin!")
    elsif current_user.try(:member?)
      redirect_to root_path, error: "權限不足無法進入"
    end
  end
end
