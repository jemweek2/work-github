class Admin::ProductsController < ApplicationController

  def index
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_products_path
  end

  def update
  end


  def product_params
    params.require(:product).permit(:name, :description, :product_image, :genre_id, :no_tax_price, :is_active)
  end

end
