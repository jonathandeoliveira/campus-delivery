class ChangeColumnToPrices < ActiveRecord::Migration[7.0]
  def change
    change_column :prices, :km_value, :decimal
  end
end
