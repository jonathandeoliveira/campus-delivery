class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :carrier
  validates :carrier_id, presence: true

  before_validation :user_domain

  def acess_carrier?(carrier)
    self.carrier == carrier
  end

  private 
  def user_domain
    domain = self.email.split('@')[1]
    carrier = Carrier.where(email_domain:domain).first
    self.carrier = carrier
  end
end