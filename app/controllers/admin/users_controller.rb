class Admin::UsersController < Admin::ApplicationController
  before_action :find_user, only: [:destroy]
  
  def index
    @users = User.all.order(:email)
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:info] = "User created"
      redirect_to admin_users_url
    else
      render 'new'
    end
   end

  def destroy
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_url
  end

  private
  	def find_user
  		@user = User.find(params[:id])
  	end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
end
