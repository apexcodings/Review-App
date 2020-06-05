class AuthorsController < ApplicationController


  def index
    if !params[:user_id]
        @authors = Author.search(params[:search]) 
    else
      @authors = Author.all
    end
end

  def show 
      @author = Author.find(params[:id])
      @courses = @author.courses
  end


end
