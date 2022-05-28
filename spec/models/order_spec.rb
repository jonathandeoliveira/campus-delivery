require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '#valid?' do
    it '' do

    end



    context '#Enum' do

      it 'Verifica o status negado do enum (0)' do
        # arrange
        carrier = Carrier.create!(brand_name: 'LexCorp',
                                  company_name: 'LexCorp Incorporated',
                                  email_domain: 'lexcorp.com',
                                  company_register: '85.732.736/0001-07',
                                  city: 'Goiânia',
                                  state: 'GO',
                                  adress: 'Av. Portugal, 1148',
                                  status: 1)

        vehicle = Vehicle.create!(lincese_plate: 'KDS-1342',
                                  brand: 'Ford',
                                  model: 'C-1419',
                                  year: 2016,
                                  weight_capacity: 7500,
                                  carrier: carrier)

        price = Price.create(size_min: 0.6, size_max: 1,
                             weight_min: 0.1, weight_max: 5,
                             km_value: 0.75, carrier: carrier)

        deadline = Deadline.create!(km_min: 0, km_max: 80, km_time: 1, carrier: carrier)

        order = Order.create!(customar_name: 'Gabriel', customer_adress: 'Rua do índio, mauá - SP',
                              derparture_adress: 'Paço municial, santo andré - SP',
                              distance: 48,
                              product_number: 'C3LUL4RT0P', size: 0.8, weight: 4,
                              carrier:carrier, vehicle: vehicle, status: 0)
        # act
        result = order.status
        # assert
        expect(result).to eq 'denied'
      end

      it 'Verifica o status Pendente do enum (10)' do
        # arrange
        carrier = Carrier.create!(brand_name: 'LexCorp',
                                  company_name: 'LexCorp Incorporated',
                                  email_domain: 'lexcorp.com',
                                  company_register: '85.732.736/0001-07',
                                  city: 'Goiânia',
                                  state: 'GO',
                                  adress: 'Av. Portugal, 1148',
                                  status: 1)

        vehicle = Vehicle.create!(lincese_plate: 'KDS-1342',
                                  brand: 'Ford',
                                  model: 'C-1419',
                                  year: 2016,
                                  weight_capacity: 7500,
                                  carrier: carrier)

        price = Price.create(size_min: 0.6, size_max: 1,
                             weight_min: 0.1, weight_max: 5,
                             km_value: 0.75, carrier: carrier)

        deadline = Deadline.create!(km_min: 0, km_max: 80, km_time: 1, carrier: carrier)

        order = Order.create!(customar_name: 'Gabriel', customer_adress: 'Rua do índio, mauá - SP',
                              derparture_adress: 'Paço municial, santo andré - SP',
                              distance: 48,
                              product_number: 'C3LUL4RT0P', size: 0.8, weight: 4,
                              carrier:carrier, vehicle: vehicle, status: 10)
        # act
        result = order.status
        # assert
        expect(result).to eq 'pending'
      end

      it 'Verifica o status aceito do enum (20)' do
        # arrange
        carrier = Carrier.create!(brand_name: 'LexCorp',
                                  company_name: 'LexCorp Incorporated',
                                  email_domain: 'lexcorp.com',
                                  company_register: '85.732.736/0001-07',
                                  city: 'Goiânia',
                                  state: 'GO',
                                  adress: 'Av. Portugal, 1148',
                                  status: 1)

        vehicle = Vehicle.create!(lincese_plate: 'KDS-1342',
                                  brand: 'Ford',
                                  model: 'C-1419',
                                  year: 2016,
                                  weight_capacity: 7500,
                                  carrier: carrier)

        price = Price.create(size_min: 0.6, size_max: 1,
                             weight_min: 0.1, weight_max: 5,
                             km_value: 0.75, carrier: carrier)

        deadline = Deadline.create!(km_min: 0, km_max: 80, km_time: 1, carrier: carrier)

        order = Order.create!(customar_name: 'Gabriel', customer_adress: 'Rua do índio, mauá - SP',
                              derparture_adress: 'Paço municial, santo andré - SP',
                              distance: 48,
                              product_number: 'C3LUL4RT0P', size: 0.8, weight: 4,
                              carrier:carrier, vehicle: vehicle, status: 20)
        # act
        result = order.status
        # assert
        expect(result).to eq 'accepted'
      end

      it 'Verifica o status Em Transito do enum (30)' do
        # arrange
        carrier = Carrier.create!(brand_name: 'LexCorp',
                                  company_name: 'LexCorp Incorporated',
                                  email_domain: 'lexcorp.com',
                                  company_register: '85.732.736/0001-07',
                                  city: 'Goiânia',
                                  state: 'GO',
                                  adress: 'Av. Portugal, 1148',
                                  status: 1)

        vehicle = Vehicle.create!(lincese_plate: 'KDS-1342',
                                  brand: 'Ford',
                                  model: 'C-1419',
                                  year: 2016,
                                  weight_capacity: 7500,
                                  carrier: carrier)

        price = Price.create(size_min: 0.6, size_max: 1,
                             weight_min: 0.1, weight_max: 5,
                             km_value: 0.75, carrier: carrier)

        deadline = Deadline.create!(km_min: 0, km_max: 80, km_time: 1, carrier: carrier)

        order = Order.create!(customar_name: 'Gabriel', customer_adress: 'Rua do índio, mauá - SP',
                              derparture_adress: 'Paço municial, santo andré - SP',
                              distance: 48,
                              product_number: 'C3LUL4RT0P', size: 0.8, weight: 4,
                              carrier:carrier, vehicle: vehicle, status:30)
        # act
        result = order.status
        # assert
        expect(result).to eq 'in_transit'
      end

      it 'Verifica o status Entregue do enum (40)' do
        # arrange
        carrier = Carrier.create!(brand_name: 'LexCorp',
                                  company_name: 'LexCorp Incorporated',
                                  email_domain: 'lexcorp.com',
                                  company_register: '85.732.736/0001-07',
                                  city: 'Goiânia',
                                  state: 'GO',
                                  adress: 'Av. Portugal, 1148',
                                  status: 1)

        vehicle = Vehicle.create!(lincese_plate: 'KDS-1342',
                                  brand: 'Ford',
                                  model: 'C-1419',
                                  year: 2016,
                                  weight_capacity: 7500,
                                  carrier: carrier)

        price = Price.create(size_min: 0.6, size_max: 1,
                             weight_min: 0.1, weight_max: 5,
                             km_value: 0.75, carrier: carrier)

        deadline = Deadline.create!(km_min: 0, km_max: 80, km_time: 1, carrier: carrier)

        order = Order.create!(customar_name: 'Gabriel', customer_adress: 'Rua do índio, mauá - SP',
                              derparture_adress: 'Paço municial, santo andré - SP',
                              distance: 48,
                              product_number: 'C3LUL4RT0P', size: 0.8, weight: 4,
                              carrier:carrier, vehicle: vehicle, status: 40)
        # act
        result = order.status
        # assert
        expect(result).to eq 'delivered'
      end


    end # context
  end # describe
end # rspec.describe
