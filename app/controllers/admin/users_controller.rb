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
      flash.alert = "User created successfully"
      redirect_to admin_users_url
    else
      flash.notice = "Something Wrong"
      render 'new'
    end
    
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    byebug
    if @user.update(user_param)
      flash.alert = "Update user successfully"
      redirect_to admin_users_url
    else
      flash.notice = "Something Wrong"
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
    flash.alert = "User was successfully destroyed!"
  end


  def user_param
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :role, :code)
  end
end