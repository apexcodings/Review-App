class SessionsController < ApplicationController
  
  def new 

  end

  def create
    if @user = User.find_by(name: params[:session][:name])
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      end
    else
      redirect_to root_url
    end
  end

  def destroy 
    if session[:user_id] != nil 
      session.delete :user_id
    end
    redirect_to root_url
  end



end