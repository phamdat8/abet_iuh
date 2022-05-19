class HomesController < ApplicationController
  before_action :authenticate_user!, except: [:test]
  def index
    if current_user.admin?
      redirect_to admin_users_url
    elsif current_user.lecturer? 
      redirect_to lecturer_subjects_url
    else
      redirect_to admin_subjects_url
    end

  end

  def test
  end

  def rake
    PiLo.all.each do |pilo|
      pilo.priority = 'E' if pilo.priority == 'H'
      pilo.priority = 'I' if pilo.priority == 'L'
      pilo.priority = 'R' if pilo.priority == 'I'
      pilo.save
    end
  end

  def measurement_plan
    @subjects = Subject.all
    @so = So.all
  end

  def new_pass
  end

  def change_pass
    if params[:confirm_pass] != params[:new_pass] || !current_user.valid_password?(params[:old_pass]) || params[:new_pass].length < 6
      flash.alert = I18n.t('password_not_match')
      return render 'new_pass'
    else
      current_user.password = params[:new_pass]
      current_user.password_confirmation = params[:new_pass]
      current_user.save
      flash.alert = I18n.t('password_changed')
      return render 'new_pass'
    end
  end
end