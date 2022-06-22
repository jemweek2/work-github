class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.all
    @total = 0
  end

  def update
    @cart_item = current_customer.cart_items.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end


  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    CartItem.destroy_all
    redirect_to cart_items_path
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path
  end


 private
  def cart_item_params
      params.require(:cart_item).permit(:product_id, :quantity)
  end
end