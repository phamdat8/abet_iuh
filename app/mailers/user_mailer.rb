class UserMailer < ApplicationMailer
  def simple_email
    mail(to: 'datpt@bestarion.com', subject: 'Test')
  end
end