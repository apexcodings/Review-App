class AuthorsController < ApplicationController


  def index
    if params[:search] != ""
        @authors = Author.search(params[:search]) 
    else
        @authors = Author.most_courses
    end
  end

  def show 
      @author = Author.find(params[:id])
      @courses = @author.courses
  end

end
