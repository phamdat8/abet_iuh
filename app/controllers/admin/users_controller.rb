class Admin::UsersController < AdminController
  def index
    @users = User.all 
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_param)
    @user.password = '123456'
    @user.password_confirmation = '123456'
    if @user.save
      flash.alert = I18n.t('user.created')
      redirect_to admin_users_url
    else
      flash.notice = I18n.t('wrong')
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_param)
      flash.alert = I18n.t('user.updated')
      redirect_to admin_users_url
    else
      flash.notice = I18n.t('wrong')
      render 'edit'
    end
    
  end

  def show
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_url
    flash.alert = I18n.t('user.deleted')
  end


  def user_param
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :role, :code, :locale)
  end
end