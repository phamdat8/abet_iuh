class Admin::UsersController < AdminController
  def index
    @users = User.all 
  end

  def new
    @user = User.new
  end

  def create
    user = User.new(user_param)
    user.password = '123456'
    user.password_confirmation = '123456'
    byebug
    user.save
    redirect_to admin_users_url 
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_param)
    @user = User.find(params[:id])
    render 'edit'
  end

  def show
  end

  def destroy
  end


  def user_param
    params.require(:user).permit(:email, :first_name, :last_name, :phone, :role, :code)
  end
end