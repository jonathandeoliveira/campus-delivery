class Order < ApplicationRecord
  enum status: {denied:0, pending:10, accepted:20, in_transit: 30, delivered:40}
  belongs_to :carrier
  belongs_to :vehicle, optional: true if pending

  before_create :generate_track_number 
  before_validation :final_price
  before_validation :deadline
  private

  def generate_track_number
    self.track_number = SecureRandom.alphanumeric(15).upcase
  end

  def final_price
    price = self.carrier.prices.where('size_min < ? and  size_max > ?', self.size,self.size ) && self.carrier.prices.where('weight_min < ? and  weight_max > ?', self.weight,self.weight )
    self.total_price = self.distance * price.first.km_value
  end

  def deadline
    deadline =  self.carrier.deadlines.where('km_min < ? and  km_max > ?', self.distance,self.distance )
    self.delivery_deadline = deadline.first.km_time

  end




end
