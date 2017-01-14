class UsersController < ApplicationController
  before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		@child = @user.first_child
	end
end
