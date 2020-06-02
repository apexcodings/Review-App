class ReviewsController < ApplicationController

  def new 
    @course = Course.find(params[:course_id])
    @review = Review.new
  end

  def create 

  end
end
