require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe '#valid?' do
    it 'domínio de e-mail inválido' do 
      #arrange
      admin = Admin.new(email:'souadmin@naosounao.com',password: 'password')
      #act
      result = admin.valid?
      #assert
      expect(result).to eq false
    end
  end
end
