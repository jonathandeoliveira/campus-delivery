class Price < ApplicationRecord
  belongs_to :carrier
  validates :size_min,:size_max, :weight_min, :weight_max, :km_value, :carrier_id, presence: true
  validates :size_min,:size_max, :weight_min, :weight_max, :km_value, numericality: { greater_than: -1 }
end
