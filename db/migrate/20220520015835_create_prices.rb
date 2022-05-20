class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.float :size_min
      t.float :size_max
      t.float :weight_min
      t.float :weight_max
      t.float :km_value
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
