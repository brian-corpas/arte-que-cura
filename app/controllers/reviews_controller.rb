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

  def destroy
    @review = Review.find(params[:id])
    if @review.destroy
      redirect_to profile_path
      flash[:notice] = "Comentário apagado"
    else
      flash[:notice] = "Comentário ainda não foi apagado"
    end
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end
