class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :configure_permitted_parameters if :devise_controller?

  def update
    super
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:name, :password, :password_confirmation, :address, :phone_number, :need_receipt]
    devise_parameter_sanitizer.for(:account_update) << [:name, :password, :password_confirmation, :address, :phone_number, :need_receipt]
  end

  def after_update_path_for(resource)
    user_path(current_user)
  end
end
