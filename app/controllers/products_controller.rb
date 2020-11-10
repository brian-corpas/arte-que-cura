class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

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
end
