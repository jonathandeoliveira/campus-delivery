class Deadline < ApplicationRecord
  belongs_to :carrier
  validates  :km_min, :km_max, :km_time, :carrier, presence: true
  validates  :km_min, :km_max, :km_time, :carrier, numericality: { greater_than: -1 }
end
