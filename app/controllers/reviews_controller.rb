class ReviewsController < ApplicationController

  def new 
    @course = Course.find(params[:course_id])
    @review = Review.new(course_id: params[:course_id], user_id: current_user.id)
  end

  def create 
    @review = Review.new(review_params)
    @course = @review.course
    @review.save 
    redirect_to course_path(@course)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :user_id, :course_id)
  end
end
