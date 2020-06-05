class LanguagesController < ApplicationController


  def index
    if !params[:user_id]
        @languages = Language.search(params[:search]) 
    else
      @languages = Language.all
    end
end

  def show 
    @language = Language.find(params[:id])
    @courses = @language.courses
  end


end
