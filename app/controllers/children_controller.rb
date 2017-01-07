class ChildrenController < ApplicationController

  def show
    @user = current_user
    @child = @user.first_child
  end

end
