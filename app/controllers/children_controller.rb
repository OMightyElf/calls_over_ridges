class ChildrenController < ApplicationController
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  def show
    @user = current_user
    @child = Child.find(params[:id])
    authorize @child
    updates = @child.updates.order(update_year: :desc, update_month: :desc).limit(6)
    @update = updates.first
    @last_update = updates.first(2).last
    @message = Message.new
  end

  private

  def user_not_authorized
    flash[:alert] = "無瀏覽權限"
    redirect_to @user.children.first
  end
end
