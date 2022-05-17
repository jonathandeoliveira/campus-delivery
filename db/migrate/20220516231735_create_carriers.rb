class CreateCarriers < ActiveRecord::Migration[7.0]
  def change
    create_table :carriers do |t|
      t.string :company_name
      t.string :company_register
      t.string :brand_name
      t.string :city
      t.string :state
      t.string :adress
      t.string :email_domain
      t.integer :status, default: 1

      t.timestamps
    end
  end
end
