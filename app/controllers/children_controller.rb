class ChildrenController < ApplicationController
  def show
    @user = current_user
    @child = Child.find(params[:id])
    updates = @child.updates.order(update_time: :desc).limit(6)
    @update = updates.first
    @last_update = updates.first(2).last
  end
end
