class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.save
    redirect_to profile_path
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
