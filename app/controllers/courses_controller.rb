class CoursesController < ApplicationController

  def new 
    @course = Course.new
  end

  def create 
    binding.pry
  end
end
