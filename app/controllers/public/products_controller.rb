class Public::ProductsController < ApplicationController
  def index
    @product = Product.page(params[:page]).per(8)
    @genres = Genre.all
    @products =Product.all
  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
  end
end
