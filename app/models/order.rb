class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details, dependent: :destroy
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting:0, confirm: 1, producing: 2, preparing: 3, shipped: 4 }

  def subtotal
    product.add_no_tax_price * quantity
  end
  belongs_to :customer
  has_many :order_detail, dependent: :destroy

end
