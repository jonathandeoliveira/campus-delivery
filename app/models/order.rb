class Order < ApplicationRecord
  belongs_to :carrier
  belongs_to :vehicle
  #validates :vehicle_id, presence: true, if: :completed? || :verified?
end
