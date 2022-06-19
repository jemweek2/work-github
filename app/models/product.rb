class Product < ApplicationRecord
  belongs_to :genre
  has_one_attached :product_image

  enum is_active: { now_on_sale: 0, not_for_sale: 1 }
end