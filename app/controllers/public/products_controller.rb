class Public::ProductsController < ApplicationController
  def index
    @product = Product.page(params[:page]).per(8)
    @genres = Genre.all
    @products =Product.all
  end

  def show
    @cart_item = CartItem.new
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :product_image, :genre_id, :no_tax_price, :is_active)
  end
end