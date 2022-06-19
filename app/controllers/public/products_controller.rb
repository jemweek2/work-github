class Public::ProductsController < ApplicationController
  def index
    @product = Product.page(params[:page])
  end

  def show
    @product = Product.find(params[:id])
  end
end
