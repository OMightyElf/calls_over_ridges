class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = User.find(params[:id])
    authorize @user
    @child = @user.first_child
    @message = Message.new
  end


  def save_receipt
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
  end

protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:receipt_url)
  end

end
