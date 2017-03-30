# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
	def sign_in_notification
		@user = User.last
		UserMailer.sign_in_notification(@user)
	end
end
