class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :genre_id, null: false
      t.integer :no_tax_price, null: false
      t.boolean :is_active, null: false, default: true

      t.timestamps null: false
    end
  end
end
