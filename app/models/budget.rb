class Budget < ApplicationRecord
  validates :height, :width, :length, :weight, :distance, presence: true 
  validates :height, :width, :length, :weight, :distance, numericality: { greater_than: 0 }
end
