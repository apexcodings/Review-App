class CoursesController < ApplicationController

  def new 
    @course = Course.new
  end

  def index
    if params[:search] != ""
        @courses = Course.search(params[:search]) 
    else
        @courses = Course.most_reviews
    end
  end

  def create 
    @course = Course.new(course_params)
  
    
    if @course.reviews.length > 0 && @course.save
      @course.reviews.last.user = current_user
      @course.reviews.last.save
         redirect_to course_path(@course)
      else 
         render :new
      end
  end

  def show 
    @course = Course.find(params[:id])
    @reviews = @course.reviews
  end

  private 
  def course_params
    params.require(:course).permit(:title, :level, :pages, :year_published, :type, :description, :author_name, :language_name, reviews_attributes: [:rating, :description])
  end
end
