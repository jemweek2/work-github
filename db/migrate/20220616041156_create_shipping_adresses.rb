class CreateShippingAdresses < ActiveRecord::Migration[6.1]
  def change
    create_table :shipping_adresses do |t|
      t.integer :customer_id, null: false
      t.string :recipient_name, null: false
      t.string :postal_code, null: false
      t.string :address, null: false

      t.timestamps null: false
    end
  end
end
