class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @monster = Monster.find(params[:monster_id])
    @review.monster = @monster
    @booking = Booking.new
    @review.user = current_user
    if @review.save
      redirect_to monster_path(@monster)
    else
      render "monsters/show", status: 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
