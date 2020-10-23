class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    @product = Product.find(params[:product_id])
    @review.product = @product
    @review.user = current_user
    if @review.save
      flash[:alert] = "Comentário registado."
      redirect_to products_path
    else
      flash[:alert] = "Por favor, repita novamente."
    end
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
