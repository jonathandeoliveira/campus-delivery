require 'rails_helper'

RSpec.describe Carrier, type: :model do
  describe '#valid? - Validações' do 
  context 'Cadastro de uma nova transportadora' do

      it 'Razão social é obrigatório' do
        #arrange
        carrier = Carrier.new(company_name:'', 
                        company_register:'00.178.762/0001-82',
                        brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                        city:'Tatuapé', state:'SP', 
                        email_domain:'@tstark.com', status: 1)
        #act
        result = carrier.valid?
        #assert
        expect(result).to eq false
      end

      it 'CPNJ é obrigatório' do
        #arrange
        carrier = Carrier.new(company_name:' Stark Technology Inc', 
                        company_register:'',
                        brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                        city:'Tatuapé', state:'SP', 
                        email_domain:'@tstark.com', status: 1)
        #act
        result = carrier.valid?
        #assert
        expect(result).to eq false
      end

      it 'Nome fantasia é obrigatório' do
        #arrange
        carrier = Carrier.new(company_name:' Stark Technology Inc', 
                        company_register:'00.178.762/0001-82',
                        brand_name:'', adress:'Rua Vilela, 663',
                        city:'Tatuapé', state:'SP', 
                        email_domain:'@tstark.com', status: 1)
        #act
        result = carrier.valid?
        #assert
        expect(result).to eq false
      end

      it 'Endereço é obrigatório' do
        #arrange
        carrier = Carrier.new(company_name:' Stark Technology Inc', 
                        company_register:'00.178.762/0001-82',
                        brand_name:'Stark Logistics', adress:'',
                        city:'Tatuapé', state:'SP', 
                        email_domain:'@tstark.com', status: 1)
        #act
        result = carrier.valid?
        #assert
        expect(result).to eq false
      end

      it 'Cidade é obrigatório' do
        #arrange
        carrier = Carrier.new(company_name:' Stark Technology Inc', 
                        company_register:'00.178.762/0001-82',
                        brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                        city:'', state:'SP', 
                        email_domain:'@tstark.com', status: 1)
        #act
        result = carrier.valid?
        #assert
        expect(result).to eq false
      end

      it 'Estado é obrigatório' do
        #arrange
        carrier = Carrier.new(company_name:' Stark Technology Inc', 
                        company_register:'00.178.762/0001-82',
                        brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                        city:'Tatuapé', state:'', 
                        email_domain:'@tstark.com', status: 1)
        #act
        result = carrier.valid?
        #assert
        expect(result).to eq false
      end

      it 'Domínio de e-mail é obrigatório' do
        #arrange
        carrier = Carrier.new(company_name:' Stark Technology Inc', 
                        company_register:'00.178.762/0001-82',
                        brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                        city:'Tatuapé', state:'SP', 
                        email_domain:'', status: 1)
        #act
        result = carrier.valid?
        #assert
        expect(result).to eq false
      end
    end #fecha context

  context 'Informações repetidas' do

    it 'falso quando um email já está em uso' do
      #arrange
      carrier1 = Carrier.create!(company_name:'Stark Technology Inc', 
                        company_register:'00.178.762/0001-82',
                        brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                        city:'Tatuapé', state:'SP', 
                        email_domain:'@tstark.com', status:1)

      carrier2= Carrier.new(company_name:'Wayne Enterprises Inc', 
                  company_register:'70.190.836/0001-81',
                  brand_name:'Wayne Express',adress:'Avenida Almirante Barroso, 81',
                  city:'Rio de Janeiro', state:'RJ',
                  email_domain:'@tstark.com', status:1)
      #act
        result = carrier2.valid?
      #assert
      expect(result).to eq false
    end

    it 'falso quando um CPNJ já está em uso' do
      #arrange
      carrier1 = Carrier.create!(company_name:'Stark Technology Inc', 
                        company_register:'00.178.762/0001-82',
                        brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                        city:'Tatuapé', state:'SP', 
                        email_domain:'@tstark.com', status:1)

      carrier2= Carrier.new(company_name:'Wayne Enterprises Inc', 
                  company_register:'00.178.762/0001-82',
                  brand_name:'Wayne Express',adress:'Avenida Almirante Barroso, 81',
                  city:'Rio de Janeiro', state:'RJ',
                  email_domain:'@tstark.com', status:1)
      #act
        result = carrier2.valid?
      #assert
      expect(result).to eq false
    end
  end

    it 'falso quando o CPNJ está no formato inválido' do
      #Arrange
      carrier = Carrier.new(company_name:'Wayne Enterprises Inc', 
        company_register:'70!190-836-0001/81',
        brand_name:'WayneCorp',adress:'Avenida Almirante Barroso, 81',
        city:'Rio de Janeiro', state:'RJ',
        email_domain:'contato@bwayne.com',status:1)
      #Act
      result = carrier.valid?
      #Assert
      expect(result).to eq false
    end

  end # fecha describe

  describe '#Enum' do
   it 'Verifica o status ativo (1)' do
      #Arrange
      carrier = Carrier.new(company_name:'Wayne Enterprises Inc', 
                company_register:'70!190-836-0001/81',
                brand_name:'WayneCorp',adress:'Avenida Almirante Barroso, 81',
                city:'Rio de Janeiro', state:'RJ',
                email_domain:'contato@bwayne.com',status:1)
      #Act
      result = carrier.status
      #Assert
      expect(result).to eq 'active'
    end

    it 'Verifica o status ativo (1)' do
      #Arrange
      carrier = Carrier.new(company_name:'Wayne Enterprises Inc', 
                company_register:'70!190-836-0001/81',
                brand_name:'WayneCorp',adress:'Avenida Almirante Barroso, 81',
                city:'Rio de Janeiro', state:'RJ',
                email_domain:'contato@bwayne.com',status:0)
      #Act
      result = carrier.status
      #Assert
      expect(result).to eq 'desactive'
    end


  end

end 
