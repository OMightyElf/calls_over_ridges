class UsersController < ApplicationController
  before_action :authenticate_user!

	def show
		@user = User.find(params[:id])
		authorize @user
		@child = @user.first_child
		@message = Message.new
	end
end
