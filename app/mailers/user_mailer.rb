class UserMailer < ApplicationMailer
  def simple_email
    mail(to: 'datpt@bestarion.com', subject: 'Test')
  end

  def approve_doc(user, doc, current_user, url)
    @url = url
    @current_user = current_user
    @doc = doc
    @user = user
    mail to: @user.email, subject: "Approve Document"
  end
end