require 'rails_helper'

RSpec.describe Deadline, type: :model do
  describe '#valid?' do
    
    it 'distância mínima não pode ficar vazia' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'@correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
      deadline = Deadline.new(km_min:'', km_max:80, km_time:1, carrier:carrier)
      #act 
      result = deadline.valid?
      #assert
      expect(result).to eq false
    end

    it 'distância máxima não pode ficar vazia' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'@correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
      deadline = Deadline.new(km_min:0, km_max:'', km_time:1, carrier:carrier)
      #act 
      result = deadline.valid?
      #assert
      expect(result).to eq false
    end

    it 'prazo não pode ficar vazio' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'@correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
      deadline = Deadline.new(km_min:0, km_max:80, km_time:'', carrier:carrier)
      #act 
      result = deadline.valid?
      #assert
      expect(result).to eq false
    end

    it 'transportadora não pode ficar vazia' do
      #arrange
      deadline = Deadline.new(km_min:0, km_max:80, km_time:1, carrier_id:'')
      #act 
      result = deadline.valid?
      #assert
      expect(result).to eq false
    end
  end #valid?

  describe '#numericality' do
    it 'distância mínima não pode ser negativa' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'@correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
      deadline = Deadline.new(km_min:-1, km_max:80, km_time:1, carrier:carrier)
      #act 
      result = deadline.valid?
      #assert
      expect(result).to eq false
    end

    it 'distância máxima não pode ser negativa' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'@correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
      deadline = Deadline.new(km_min:0, km_max:-1, km_time:1, carrier:carrier)
      #act 
      result = deadline.valid?
      #assert
      expect(result).to eq false
    end

    it 'prazo não pode ser negativo' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'@correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
      deadline = Deadline.new(km_min:0, km_max:80, km_time:-1, carrier:carrier)
      #act 
      result = deadline.valid?
      #assert
      expect(result).to eq false
    end

  end #numericality
end
