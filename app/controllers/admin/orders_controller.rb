class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    @total = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    order = Order.find(params[:id])
    order.update(order_params)
    redirect_to admin_order_path
  end

  private
  def order_params
    params.require(:order).permit(:order_status)
  end

end
