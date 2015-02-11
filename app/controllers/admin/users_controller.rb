class Admin::UsersController < Admin::ApplicationController
  
  def index
    @users = User.all.order(:email)
  end

end
