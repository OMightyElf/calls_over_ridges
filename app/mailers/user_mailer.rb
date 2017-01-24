class UserMailer < ApplicationMailer
  def sign_in_notification(user)
    @user = user
    mail(to: @user.email, subject: '遠山呼喚貧童資助平台／帳號密碼設定！', content_type: "text/html")
  end
end
