class CartItem < ApplicationRecord
  belongs_to :product
  belongs_to :customer

  validates :quantity, inclusion: { in: 1..10 }

  def subtotal
    product.add_no_tax_price * quantity
  end

end
