class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :carrier, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true
      t.float :size
      t.float :weight
      t.string :customar_name
      t.string :customer_adress
      t.string :derparture_adress
      t.integer :distance
      t.string :track_number
      t.integer :status, default: 10
      t.string :product_number
      t.decimal :total_price
      t.date :delivery_deadline
      t.timestamps
    end
  end
end
