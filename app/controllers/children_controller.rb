class ChildrenController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    @child = Child.find(params[:id])
    if authorize @child
      updates = @child.updates.order(update_year: :desc, update_month: :desc).limit(6)
      @update = updates.first
      @last_update = updates.first(2).last
      @message = Message.new
    else
      redirect_to @user.children.first
    end
  end
end
