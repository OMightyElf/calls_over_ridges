class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
    @user = User.find(params[:id])
    authorize @user
    @child = @user.first_child
    @message = Message.new
    if @user == current_user
      redirect_to profile_path
    end
  end

  def index
    redirect_to admin_users_path
  end

  def profile
    @user = current_user
    @child = @user.first_child
    @message = Message.new
    render 'show'
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

  def user_not_authorized
    flash[:alert] = "無瀏覽權限"
    redirect_to profile_path
  end

# protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.permit(:receipt_url)
#   end
end
