class MessagesController < ApplicationController
	def create
		@message = Message.new(message_params)
		@message.save

		redirect_to request.referrer, notice: '謝謝您的留言，請靜候遠山呼喚的團隊處理，感謝！'
	end

	private

	def message_params
		params.require(:message).permit(:target, :picture, :content, :user_id)
	end
end
