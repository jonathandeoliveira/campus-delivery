require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#valid?' do
    it 'transportadora não pode ficar vazia' do 
      #arrange
      user = User.new(email:'jose@correios.com', password:'password', carrier_id:'')
      #act
      result = user.valid?
      #assert
      expect(result).to eq false
    end

  end
end
