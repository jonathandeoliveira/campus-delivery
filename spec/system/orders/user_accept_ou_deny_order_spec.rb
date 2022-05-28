require 'rails_helper'

describe 'Transportador aceita uma ordem de serviço' do
  it 'a partir da página de sua transportadora' do
    #arrange
    carrier = Carrier.create!(brand_name:'Stranding Logistics', 
                              company_name:'Kojima H. Entregas Inc', 
                              email_domain:'dslog.com',
                              company_register:'01.345.140/0001-64', 
                              city:'São Bernardo do Campo',
                              state: 'SP' ,
                              adress:'Rua jônio, 66',
                              status:1)
    user = User.create!(email:'norman@dslog.com', password:'password', carrier:carrier)
    Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Yamaha',
                    model:'Fazer 250',
                    year:2020,
                    weight_capacity:100,
                    carrier:carrier)

    price = Price.create(size_min:0.6, size_max:1,
                        weight_min:0.1, weight_max:5,
                        km_value:0.75,carrier:carrier)
    deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)
    order1 = Order.new(customar_name:'Gabriel',customer_adress:'Rua do índio, mauá - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:48, track_number:'KINZECARACTERES',
                          product_number:'C3LUL4RT0P', size:0.8, weight:4 ,
                          carrier:carrier, vehicle_id:'', status: 10)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('KINZECARACTERES')
    order1.save
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Stranding Logistics'
    click_on 'KINZECARACTERES'
    #assert
    expect(page).to have_content 'Ordem de serviço pendente:'
    expect(page).to have_content 'KINZECARACTERES'
    expect(page).to have_field 'Veículo'
    expect(page).to have_button 'Aceitar'
    expect(page).to have_button 'Recusar'
    end

  it 'com sucesso' do
    #arrange
    carrier = Carrier.create!(brand_name:'Stranding Logistics', 
                              company_name:'Kojima H. Entregas Inc', 
                              email_domain:'dslog.com',
                              company_register:'01.345.140/0001-64', 
                              city:'São Bernardo do Campo',
                              state: 'SP' ,
                              adress:'Rua jônio, 66',
                              status:1)
    user = User.create!(email:'norman@dslog.com', password:'password', carrier:carrier)
    Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Yamaha',
                    model:'Fazer 250',
                    year:2020,
                    weight_capacity:100,
                    carrier:carrier)
    Vehicle.create!(lincese_plate:'YJX-4321', 
                      brand:'Honda',
                      model:'CG Cargo',
                      year:2020,
                      weight_capacity:150,
                      carrier:carrier)
    price = Price.create(size_min:0.6, size_max:1,
                        weight_min:0.1, weight_max:5,
                        km_value:0.75,carrier:carrier)
    deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)
    order1 = Order.new(customar_name:'Gabriel',customer_adress:'Rua do índio, mauá - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:48, track_number:'KINZECARACTERES',
                          product_number:'C3LUL4RT0P', size:0.8, weight:4 ,
                          carrier:carrier, vehicle_id:'', status: 10)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('KINZECARACTERES')
    order1.save
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Stranding Logistics'
    click_on 'KINZECARACTERES'
    select 'Yamaha/Fazer 250/2020- Placa:KDS-1342 - Capacidade de carga: 100Kg', from: 'Veículo'
    click_on 'Selecionar veículo'
    click_on 'Aceitar'
    #assert
    expect(page).to have_content 'Ordem atualizada com sucesso'
    expect(page).not_to have_button 'Aceitar'
    expect(page).not_to have_button 'Recusar'
  end


end