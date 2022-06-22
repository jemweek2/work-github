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
# new 画面から渡ってきたデータを @order に入れます
  if params[:order][:address_no] == "1"
# view で定義している address_number が"1"だったときにこの処理を実行します
# form_with で @order で送っているので、order に紐付いた address_number となります。以下同様です
# この辺の紐付けは勉強不足なので gem の pry-byebug を使って確認しながら行いました
    @order.shipping_name = current_customer.family_name+current_customer.first_name
    # @order の各カラムに必要なものを入れます
    @order.shipping_address = current_customer.address
    @order.postal_code = current_customer.postal_code
  elsif params[:order][:address_no] == "2"
# view で定義している address_number が"2"だったときにこの処理を実行します
    if ShippingAdress.exists?(recipient_name: params[:order][:registered])
# registered は viwe で定義しています
     @order.shipping_name = ShippingAdress.find(params[:order][:registered]).recipient_name
     @order.shipping_address = ShippingAdress.find(params[:order][:registered]).address
     @order.postal_code = ShippingAdress.find(params[:order][:registered]).postal_code
    else
      render :new
# 既存のデータを使っていますのでありえないですが、万が一データが足りない場合は new を render します
    end
  elsif params[:order][:address_no] == "3"
# view で定義している address_number が"3"だったときにこの処理を実行します
    address_new = current_customer.addresses.new(address_params)
    if address_new.save # 確定前(確認画面)で save してしまうことになりますが、私の知識の限界でした
    else
      render :new
# ここに渡ってくるデータはユーザーで新規追加してもらうので、入力不足の場合は new に戻します
    end
  else
    redirect_to 遷移したいページ # ありえないですが、万が一当てはまらないデータが渡ってきた場合の処理です
  end
  @cart_items = current_customer.cart_items.all # カートアイテムの情報をユーザーに確認してもらうために使用します
  @total = @cart_items.inject(0) { |sum, item| sum + item.sum_price }
# 合計金額を出す処理です sum_price はモデルで定義したメソッドです
end

  def thank
  end

  def index
  end

  def show
  end

  def order_params
    params.require(:order).permit(:postal_code, :shipping_address, :shipping_name, :postage, :total_price,
    :payment_method, :order_status, :cutomer_id)
  end
end
