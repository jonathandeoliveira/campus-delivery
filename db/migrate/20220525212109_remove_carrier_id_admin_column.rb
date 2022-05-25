class RemoveCarrierIdAdminColumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :admins, :carrier_id, :integer
  end
end
