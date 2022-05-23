class Carrier < ApplicationRecord
  validates :company_name, :company_register, :brand_name, :adress, :city,
            :state, :email_domain, presence: true
  validates :email_domain, uniqueness: true
  validates :company_register, uniqueness: true
  validates :company_register, length: {is: 18}
  validates :company_register, format: 
  { with: /\A\d{2}\.\d{3}\.\d{3}\/000[1-2]-\d{2}\z/}
  has_many :vehicles
  has_many :prices
  has_many :users
  has_many :admins
  has_many :deadlines
end
