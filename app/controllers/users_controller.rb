class UsersController < ApplicationController

  def home 
      if !session[:user_id]
        @user = User.new 
      else  
        @user = User.find(session[:user_id])
        redirect_to user_path(@user)
      end
  end

  def index 
    @users = User.all 
  end

  def new 
    if !session[:user_id]
      @user = User.new 
    else  
      @user = User.find(session[:user_id])
      redirect_to user_path(@user)
    end
  end

  def create 
    @user = User.new(user_params)
    if @user.save 
      session[:user_id] = @user.id 
      redirect_to user_path(@user)
    else 
      render '/users/home'
    end
  end

  def show
    @user = User.find(params[:id])
    @reviews = @user.reviews
  end

  private 

  def user_params 
    params.require(:user).permit(:name, :password, :password_confirmation, :email)
  end

end
