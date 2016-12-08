class UserMailer < ApplicationMailer
  default from: 'from@example.com'

  def welcome_email(user)
    @user = user
    @url = "http://example.com/login"
    mail(to: "test_email@example.com", subject: "Welcome to 99cats!")
  end
end
