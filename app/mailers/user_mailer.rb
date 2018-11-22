class UserMailer < ApplicationMailer
  default from: 'rgpd-test.rgpd-test@madparis.fr'

  def welcome_email
    @user = params[:user]
    @url = "http://example.com/login"
    mail(to: @user.email, subject: 'Welcome to my Awesome Site')
  end
end
