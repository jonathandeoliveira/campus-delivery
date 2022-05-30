class Budget < ApplicationRecord
  validates :height, :width, :length, :weight, :distance, presence: true 
  validates :height, :width, :length, :weight, :distance, numericality: { greater_than: 0 }




  def volum_calculator
    height * width * length
  end






end
