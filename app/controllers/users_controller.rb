class UsersController < ApplicationController

  def home 

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




end
