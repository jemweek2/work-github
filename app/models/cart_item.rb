class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  def subtotal
    product.add_no_tax_price * quantity
  end
end
