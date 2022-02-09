class HomesController < ApplicationController
  # before_action :authenticate_user!
  def index
    UserMailer.simple_email.deliver_now
    if current_user.admin?
      redirect_to admin_root_url
    else
      redirect_to lecturer_root_url
    end 
  end
end