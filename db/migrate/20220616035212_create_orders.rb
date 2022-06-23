class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :postal_code, null: false
      t.string :shipping_address, null: false
      t.string :shipping_name, null: false
      t.integer :postage, null: false
      t.integer :total_price, null: false
      t.integer :payment_method, null: false, default: 0
      t.integer :order_status, null: false, default: 0
      t.integer :customer_id, null: false

      t.timestamps null: false
    end
  end
end
