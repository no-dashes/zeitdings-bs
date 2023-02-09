class UserMailer < ApplicationMailer

  def welcome_email(greeting)
    @greeting = greeting
    mail(to: 'test@example.com', subject: 'Huhu!')
  end

end
