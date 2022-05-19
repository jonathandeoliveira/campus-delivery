class Vehicle < ApplicationRecord
  belongs_to :carrier
  validates :lincese_plate, :brand, :model, :year, :weight_capacity, :carrier_id, presence: true
  validates :lincese_plate, uniqueness: true
  validates :weight_capacity, numericality: { greater_than: 0 }
end