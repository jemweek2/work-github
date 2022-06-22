class OrderDetail < ApplicationRecord
  belongs_to :order
  enum production_status: { cant: 0, waiting: 1, producing: 2, completed: 4 }
  belongs_to :order
end
