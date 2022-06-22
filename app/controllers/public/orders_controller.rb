class Public::OrdersController < ApplicationController
  def new
    @order = Order.new

  end

  def create
    @order = Order.new(order_params)
    @order.cutomer_id = current_customer.id
    @order.save
    redirect_to confirmation_path

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
    redirect_to 遷移したいページ
  end


  @cart_items = current_customer.cart_items.all
  @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }

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
