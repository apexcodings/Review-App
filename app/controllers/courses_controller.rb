class CoursesController < ApplicationController

  def new 
    @course = Course.new
  end

  def create 
    @course = Course.new(course_params)
    if @course.save 
      redirect_to course_path(@course)
    else 
      redirect_to course_path
    end
  end

  def show 
    @course = Course.find(params[:id])
    @reviews = @course.reviews
    @languages = @course.language
  end

  private 
  def course_params
    params.require(:course).permit(:title, :level, :pages, :year_published, :type, :description, :author_name, :language_name)
  end
end
