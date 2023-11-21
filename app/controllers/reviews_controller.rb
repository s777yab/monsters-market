class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @monster = Monster.find(:monster_id)
    @review.monster = @monster
    @review.user = current_user
    if @review.save
      render "monsters/show", status: 200
    else
      render "monsters/show", status: 422
    end
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
