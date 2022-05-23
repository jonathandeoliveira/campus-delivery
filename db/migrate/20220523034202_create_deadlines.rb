class CreateDeadlines < ActiveRecord::Migration[7.0]
  def change
    create_table :deadlines do |t|
      t.integer :km_min
      t.integer :km_max
      t.integer :km_time
      t.references :carrier, null: false, foreign_key: true

      t.timestamps
    end
  end
end
