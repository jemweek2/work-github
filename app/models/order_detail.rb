class OrderDetail < ApplicationRecord
  enum production_status: { cant: 0, waiting: 1, producing: 2, completed: 4 }
end
