class Public::OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    cart_items = current_customer.cart_items.all
    @order = current_customer.orders.new(order_params)
    @order.save
      cart_items.each do |cart|
        order_detail = OrderDetail.new
        order_detail.product_id = cart.product_id
        order_detail.order_id = @order.id
        order_detail.quantity = cart.quantity
        order_detail.price = cart.product.add_no_tax_price
        order_detail.save
      end
      redirect_to thank_orders_path
      cart_items.destroy_all
  end

def confirmation
  @order = Order.new(order_params)


  if params[:order][:address_no] == "1"

    @order.shipping_name = current_customer.family_name+current_customer.first_name

    @order.shipping_address = current_customer.address
    @order.postal_code = current_customer.postal_code

   elsif params[:order][:address_no] == "2"

    @shipping_address = ShippingAdress.find(params[:order][:address_id])

     @order.shipping_name = @shipping_address.recipient_name
     @order.shipping_address = @shipping_address.address
     @order.postal_code = @shipping_address.postal_code


  elsif params[:order][:address_no] == "3"

  else
    redirect_to new_order_path
  end


  @cart_item = current_customer.cart_items.all
  @total = 0
end

  def thank
  end

  def index
  end

  def show
  end

private

  def order_params
    params.require(:order).permit(:postal_code, :shipping_address, :shipping_name, :postage, :total_price,
    :payment_method, :order_status, :cutomer_id)
  end

    def address_params
      params.require(:order).permit(:postal_code,:shipping_name,:shipping_address)
    end
end