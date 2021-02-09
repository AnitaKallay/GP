class UserMailer < ApplicationMailer
  default from: 'anitakallay30@gmail.com'

  def registration_confirmation(user)
    @user = user
    mail(to: @user.email, subject: 'Registration Confirmation')
  end

  def forgot (user)
   @user = user
   @link = "http://localhost:3000/app/passwords/reset"
   mail(to: @user.email, subject: 'Reset password instructions')
  end
end
