class Vehicle < ApplicationRecord
  belongs_to :carrier
  has_many :orders
  validates :lincese_plate, :brand, :model, :year, :weight_capacity, :carrier_id, presence: true
  validates :lincese_plate, uniqueness: true
  validates :weight_capacity, numericality: { greater_than: 0 }

  def full_description
    "#{brand} - #{model} - #{year} - Capacidade de carga: #{weight_capacity}Kg"
  end
end
