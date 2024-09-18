class UserMailer < ApplicationMailer
  def confirmation_email(user)
    @user = user
    @url = confirm_email_url(token: @user.confirmation_token)
    mail(to: @user.email, subject: 'Confirme seu email')
  end
end
