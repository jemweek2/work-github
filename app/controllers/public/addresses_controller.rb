class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @shipping_adress = ShippingAdress.new
    @shipping_adresses = ShippingAdress.all

  end

  def create
    @shipping_adresses = ShippingAdress.all
    @shipping_adress = ShippingAdress.new(shipping_adress_params)
    @shipping_adress.customer_id = current_customer.id
    @shipping_adress.save
    redirect_to addresses_path

  end

  def edit
  end

  def update
  end

  def destroy
  end

  def shipping_adress_params
    params.require(:shipping_adress).permit(:customer_id, :recipient_name,:postal_code,:address)
  end

end
