require 'rails_helper'

RSpec.describe DeliveryUpdate, type: :model do
  describe '#valid' do
    it 'Local não pode ficar vazio' do 
      #arrange
      carrier = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)

      vehicle = Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Ford',
                    model:'C-1419',
                    year:2016,
                    weight_capacity:7500,
                    carrier:carrier)

      price = Price.create(size_min:0.6, size_max:1,
                        weight_min:0.1, weight_max:5,
                        km_value:0.75,carrier:carrier)

      deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)

      order = Order.create!(customar_name:'Douglas',customer_adress:'Rua dos condomínios, Santo André - SP',
                            derparture_adress:'Paço municial, santo andré - SP',
                            distance:12,
                            product_number:'N0T3B00K-G4M3R', size:0.8, weight:4 ,
                            carrier:carrier, vehicle:vehicle, status: 30)
      delivery_update = DeliveryUpdate.new(order: order, coord_position:'' ,delivery_description: 'Objeto chegou ao centro de destribuição' )
      #act
      result = delivery_update.valid?
      #assert
      expect(result).to eq false
    end
    
    it 'Descrição não pode ficar vazio' do 
      #arrange
      carrier = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)

      vehicle = Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Ford',
                    model:'C-1419',
                    year:2016,
                    weight_capacity:7500,
                    carrier:carrier)

      price = Price.create(size_min:0.6, size_max:1,
                        weight_min:0.1, weight_max:5,
                        km_value:0.75,carrier:carrier)

      deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)

      order = Order.create!(customar_name:'Douglas',customer_adress:'Rua dos condomínios, Santo André - SP',
                            derparture_adress:'Paço municial, santo andré - SP',
                            distance:12,
                            product_number:'N0T3B00K-G4M3R', size:0.8, weight:4 ,
                            carrier:carrier, vehicle:vehicle, status: 30)
      delivery_update = DeliveryUpdate.new(order: order, coord_position:'CDD São Paulo' ,delivery_description: '' )
      #act
      result = delivery_update.valid?
      #assert
      expect(result).to eq false
    end


  end
end
