class ChangeOrderVehicleToOptional < ActiveRecord::Migration[7.0]
  def change
    change_column_null :orders, :vehicle_id, true
  end
end
