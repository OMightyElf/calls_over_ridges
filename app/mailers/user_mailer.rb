class UserMailer < ApplicationMailer
  def sign_in_notification(user)
    @user = user
    mail(to: @user.email, subject: '遠山呼喚資助人——點開以啟用您的專屬貧童資助平台！', content_type: "text/html")
  end
end
