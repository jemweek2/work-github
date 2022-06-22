class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :shipping_adresses, dependent: :destroy
  has_many :cart_items, dependent: :destroy


  has_many :product, dependent: :destroy
  has_many :orders, dependent: :destroy


end
