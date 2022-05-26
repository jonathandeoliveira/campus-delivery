require 'rails_helper'

RSpec.describe Price, type: :model do
  describe '#valid?' do
    it 'tamanho mínimo não pode ficar vazio' do 
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)

      price = Price.new(size_min:'', size_max:0.5,
                        weight_min:0.1, weight_max:5,
                        km_value:0.35,carrier:carrier)

      #act
      result = price.valid?
      #assert
      expect(result).to eq false
    end

    it 'tamanho máximo não pode ficar vazio' do 
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)

      price = Price.new(size_min:0.1, size_max:'',
                        weight_min:0.1, weight_max:5,
                        km_value:0.35,carrier:carrier)

      #act
      result = price.valid?
      #assert
      expect(result).to eq false
    end

    it 'peso mínimo não pode ficar vazio' do 
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)

      price = Price.new(size_min:0.1, size_max:0.5,
                        weight_min:'', weight_max:5,
                        km_value:0.35,carrier:carrier)

      #act
      result = price.valid?
      #assert
      expect(result).to eq false
    end

    it 'peso máximo não pode ficar vazio' do 
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)

      price = Price.new(size_min:0.1, size_max:0.5,
                        weight_min:0.1, weight_max:'',
                        km_value:0.35,carrier:carrier)

      #act
      result = price.valid?
      #assert
      expect(result).to eq false
    end

    it 'valor por km não pode ficar vazio' do 
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)

      price = Price.new(size_min:0.1, size_max:0.5,
                        weight_min:0.1, weight_max:5,
                        km_value:'',carrier:carrier)

      #act
      result = price.valid?
      #assert
      expect(result).to eq false
    end

    it 'transportadora é obrigatório' do 
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)

      price = Price.new(size_min:0.1, size_max:0.5,
                        weight_min:0.1, weight_max:5,
                        km_value:0.35,carrier_id:'')

      #act
      result = price.valid?
      #assert
      expect(result).to eq false
    end


  end
end
