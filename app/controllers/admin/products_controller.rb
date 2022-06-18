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
  end

  def create
    product = Product.new(product_params)
    product.save
    redirect_to admin_products_path
  end

  def update
  end


  def product_params
    params.require(:product).permit(:name, :description)
  end

end
