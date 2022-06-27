class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :product

  enum production_status: { cant: 0, waiting: 1, producing: 2, completed: 4 }

  def subtotal
    product.add_no_tax_price * quantity
  end

end
