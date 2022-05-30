class Price < ApplicationRecord
  belongs_to :carrier
  validates :size_min,:size_max, :weight_min, :weight_max, :km_value, :carrier_id, presence: true
  validates :size_min,:size_max, :weight_min, :weight_max, :km_value, numericality: { greater_than: -1 }


  scope :search, ->(size,weight) do 
    Price.joins(:carrier).where(carrier: {status: :active})
            .where('size_min < ? and  size_max > ?', size,size )
            .where('weight_min < ? and  weight_max > ?', weight,weight )
  end
end
