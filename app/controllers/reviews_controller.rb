class ReviewsController < ApplicationController
  def create
    @bar = Bar.find(params[:bar_id])
    @review = Review.new(review_params)
    @review.bar = @bar
    @review.user = current_user
    if @review.save
      redirect_to bar_path(@bar)
    else
      render 'bars/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
