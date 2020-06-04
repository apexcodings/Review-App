class CoursesController < ApplicationController

  def new 
    @course = Course.new
  end

  def index
    @courses = Course.all
  end

  def create 
    @course = Course.new(course_params)
    @course.reviews.last.user = current_user
      if @course.save 
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
