class DeliveryUpdate < ApplicationRecord
  belongs_to :order
  validates :delivery_description, :coord_position , presence: true
end
