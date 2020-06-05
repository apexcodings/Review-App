class LanguagesController < ApplicationController


  def index
    if params[:search] != "" 
        @languages = Language.search(params[:search]) 
    else
        @languages = Language.most_courses
    end
  end

  def show 
    @language = Language.find(params[:id])
    @courses = @language.courses
  end

end
