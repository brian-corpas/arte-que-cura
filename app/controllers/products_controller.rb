class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    if params[:term]
      @products = Product.search_by_full_name(params[:term])
    else
      @products = Product.all
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  private

  def product_params
    params.require(:product).permit()
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
