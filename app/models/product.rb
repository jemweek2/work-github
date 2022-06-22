class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_item, dependent: :destroy
  has_one_attached :product_image


  def  add_no_tax_price
  (self.no_tax_price * 1.10).round
  end

end