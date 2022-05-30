class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.float :height
      t.float :width
      t.float :length
      t.float :weight
      t.integer :distance
      t.string :query_result

      t.timestamps
    end
  end
end