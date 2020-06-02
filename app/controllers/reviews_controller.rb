class ReviewsController < ApplicationController

  def new 
    @course = Course.find(params[:course_id])
    @review = @course.reviews.build
  end

  def create 
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save 
    redirect_to course_path(@review.course)
  end

  def show 
    @review = Review.find(params[:id])
    @course = @review.course
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :user_id, :course_id)
  end
end
