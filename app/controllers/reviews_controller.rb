class ReviewsController < ApplicationController

  def new 
    @course = Course.find(params[:course_id])
    @review = @course.reviews.build
  end

  def create 
    @review = Review.new(review_params)
    @review.user = current_user
    if @review.save 
      redirect_to course_path(@review.course)
    else 
      @course = @review.course
      render :new
    end 
  end

  def show 
    @review = Review.find(params[:id])
    @course = @review.course
  end

  def edit 
    @review = Review.find(params[:id])
    @course = @review.course
  end

  def update 
      @review = Review.find(params[:id])
      if @review.user_id == current_user.id 
        @review.update(review_params)
        @review.save 
        redirect_to course_review_path(@review.course, @review)
      else 
        @review.errors.add(:review_edit, "can only be performed by the user who created the review")
        @course = @review.course
        render :edit
      end
  end

  def destroy

  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :user_id, :course_id)
  end
end
