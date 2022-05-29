class CreateDeliveryUpdates < ActiveRecord::Migration[7.0]
  def change
    create_table :delivery_updates do |t|
      t.references :order, null: false, foreign_key: true
      t.string :coord_position
      t.string :delivery_description

      t.timestamps
    end
  end
end
