class AuthorsController < ApplicationController


  def index 
    @authors = Author.all 
  end

  def show 
      @author = Author.find(params[:id])
      @courses = @author.courses
  end


end
