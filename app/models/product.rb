class Product < ApplicationRecord
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details
  has_one_attached :product_image


  def  add_no_tax_price
  (self.no_tax_price * 1.10).round
  end

  def self.looks(search, word)
    if search == "perfect_match"
      @product = Product.where("name LIKE?", "#{word}")
    elsif search == "forward_match"
      @product = Product.where("name LIKE?","#{word}%")
    elsif search == "backward_match"
      @product = Product.where("name LIKE?","%#{word}")
    elsif search == "partial_match"
      @product = Product.where("name LIKE?","%#{word}%")
    else
      @product = Product.all
    end
  end

  def self.search(keyword)
  where(["name like? OR descriptionlike?", "%#{keyword}%", "%#{keyword}%"])
  end

end