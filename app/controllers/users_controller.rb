class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  def show
    @user = User.find(params[:id])
    if authorize @user
      @child = @user.first_child
      @message = Message.new
    else
      redirect_to current_user
    end
  end

  def index
    redirect_to admin_users_path
  end

  def save_receipt
    @user = User.find(params[:user_id])
    authorize @user
    @user.update(user_params)
    @user.payment_needs_confirmation!
    redirect_to user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:receipt_url, :payment_info)
  end

# protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:receipt_url)
#   end
end
