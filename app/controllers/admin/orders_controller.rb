class Admin::OrdersController < ApplicationController
  def index
    @orders = Order.page(params[:page]).per(10)
    @total = 0
  end

  def show
    @order = Order.find(params[:id])
    @order_details = @order.order_details


  end
end
