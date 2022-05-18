require 'rails_helper'

RSpec.describe Vehicle, type: :model do
  describe '#valid? - Validações' do
    context 'Cadastro de novo veículo' do

      it 'Placa é obrigatória' do
        #arrange
        carrier = Carrier.create!(company_name:' Stark Technology Inc',
                                  company_register:'00.178.762/0001-82',
                                  brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                                  city:'Tatuapé', state:'SP', 
                                  email_domain:'@tstark.com', status: 1)
        vehicle = Vehicle.new(lincese_plate:'', 
                              brand:'Mercedes-Benz',
                              model:'Accelo 915',
                              year: 2004,
                              weight_capacity: 3200,
                              carrier: carrier)
        #act
        result = vehicle.valid?
        #assert
        expect(result).to eq false
      end

      it 'marca é obrigatória' do
        #arrange
        carrier = Carrier.create!(company_name:' Stark Technology Inc',
                                  company_register:'00.178.762/0001-82',
                                  brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                                  city:'Tatuapé', state:'SP', 
                                  email_domain:'@tstark.com', status: 1)
        vehicle = Vehicle.new(lincese_plate:'KCS-8503', 
                              brand:'',
                              model:'Accelo 915',
                              year: 2004,
                              weight_capacity: 3200,
                              carrier: carrier)
        #act
        result = vehicle.valid?
        #assert
        expect(result).to eq false
      end

      it 'modelo é obrigatório' do
        #arrange
        carrier = Carrier.create!(company_name:' Stark Technology Inc',
                                  company_register:'00.178.762/0001-82',
                                  brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                                  city:'Tatuapé', state:'SP', 
                                  email_domain:'@tstark.com', status: 1)
        vehicle = Vehicle.new(lincese_plate:'KCS-8503', 
                              brand:'Mercedes-Benz',
                              model:'',
                              year: 2004,
                              weight_capacity: 3200,
                              carrier: carrier)
        #act
        result = vehicle.valid?
        #assert
        expect(result).to eq false
      end

      it 'ano é obrigatório' do
        #arrange
        carrier = Carrier.create!(company_name:' Stark Technology Inc',
                                  company_register:'00.178.762/0001-82',
                                  brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                                  city:'Tatuapé', state:'SP', 
                                  email_domain:'@tstark.com', status: 1)
        vehicle = Vehicle.new(lincese_plate:'KCS-8503', 
                              brand:'Mercedes-Benz',
                              model:'Accelo 915',
                              year: '',
                              weight_capacity: 3200,
                              carrier: carrier)
        #act
        result = vehicle.valid?
        #assert
        expect(result).to eq false
      end

      it 'Capacidade de carga é obrigatória' do
        #arrange
        carrier = Carrier.create!(company_name:' Stark Technology Inc',
                                  company_register:'00.178.762/0001-82',
                                  brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                                  city:'Tatuapé', state:'SP', 
                                  email_domain:'@tstark.com', status: 1)
        vehicle = Vehicle.new(lincese_plate:'KCS-8503', 
                              brand:'Mercedes-Benz',
                              model:'Accelo 915',
                              year: 2004,
                              weight_capacity: '',
                              carrier: carrier)
        #act
        result = vehicle.valid?
        #assert
        expect(result).to eq false
      end

      it 'Transportadora é obrigatória' do
        #arrange
        carrier = Carrier.new(company_name:' Stark Technology Inc',
                                  company_register:'00.178.762/0001-82',
                                  brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                                  city:'Tatuapé', state:'SP', 
                                  email_domain:'@tstark.com', status: 1)
        vehicle = Vehicle.new(lincese_plate:'KCS-8503', 
                              brand:'Mercedes-Benz',
                              model:'Accelo 915',
                              year: 2004,
                              weight_capacity: 3200,
                              carrier: carrier)
        #act
        result = vehicle.valid?
        #assert
        expect(result).to eq false
      end
    end#context

    it 'Placa já cadastrada' do
      #arrange
      carrier = Carrier.create!(brand_name:'LexCorp', 
                                company_name:'LexCorp Incorporated', 
                                email_domain:'@lexcorp.com',
                                company_register:'85.732.736/0001-07', 
                                city:'Goiânia',
                                state: 'GO' ,
                                adress:'Av. Portugal, 1148',
                                status:1)

      v1 = Vehicle.create!(lincese_plate:'KDS-1342', 
                      brand:'Ford',
                      model:'C-1419',
                      year:2016,
                      weight_capacity:7500,
                      carrier:carrier)

      v2 = Vehicle.new(lincese_plate:'KDS-1342', 
                      brand:'Mercedes-Benz',
                      model:'Accelo 915',
                      year:2004,
                      weight_capacity:3200,
                      carrier:carrier)
      #act
      result = v2.valid?
      #assert
      expect(result).to eq false
    end

    it 'Capacidade de carga não pode ser menor que 1' do
      #arrange
      carrier = Carrier.create!(brand_name:'LexCorp', 
                                company_name:'LexCorp Incorporated', 
                                email_domain:'@lexcorp.com',
                                company_register:'85.732.736/0001-07', 
                                city:'Goiânia',
                                state: 'GO' ,
                                adress:'Av. Portugal, 1148',
                                status:1)
      vehicle = Vehicle.new(lincese_plate:'KDS-1342', 
                            brand:'Ford',
                            model:'C-1419',
                            year:2016,
                            weight_capacity:0,
                            carrier:carrier)
      #act
      result = vehicle.valid?
      #assert
      expect(result).to eq false
    end
  end #describe
end #rpec
