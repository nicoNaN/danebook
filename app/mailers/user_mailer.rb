class UserMailer < ApplicationMailer
  default from: "welcome@danebook.moe"

  def welcome(user)
    @user = user
    mail(to: @user.email, subject: "Welcome to Danebook!"
  end
end
