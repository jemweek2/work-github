class Order < ApplicationRecord
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum order_status: { waiting:0, confirm: 1, producing: 2, preparing: 3, shipped: 4 }
  belongs_to:customer
end
