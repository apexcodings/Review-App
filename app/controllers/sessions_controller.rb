class SessionsController < ApplicationController
  
  def new 

  end

  def create 

  end

  def destroy 
    if session[:user_id] != nil 
      session.delete :user_id
    end
    redirect_to root_url
  end



end