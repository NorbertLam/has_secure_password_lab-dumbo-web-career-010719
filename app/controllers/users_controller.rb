class UsersController < ApplicationController

  def new
    
  end

  def create
    user = User.create(user_params)

      # byebug
    if user_params[:password] == user_params[:password_confirmation]
      
      session[:user_id] = user.id
        
      redirect_to "/users/#{user.id}"
    else
      redirect_to '/users/new'
    end
    
  end

  def show
  end
 
  private
 
  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end

end