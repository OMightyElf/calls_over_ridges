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

end
