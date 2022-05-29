require 'rails_helper'

describe 'Usuário atualiza as informações de um pedido' do
  it 'a partir da homepage' do
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

    vehicle = Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Yamaha',
                    model:'Fazer 250',
                    year:2020,
                    weight_capacity:100,
                    carrier:carrier)
    price = Price.create(size_min:0.6, size_max:1,
                        weight_min:0.1, weight_max:5,
                        km_value:0.75,carrier:carrier)
    deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)

    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('KINZECARACTERES')
    order = Order.create(customar_name:'Gabriel',customer_adress:'Rua do índio, mauá - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:48, track_number:'KINZECARACTERES',
                          product_number:'C3LUL4RT0P', size:0.8, weight:4 ,
                          carrier:carrier, vehicle:vehicle, status: 10)
    order.accepted!
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Stranding Logistics'
    click_on 'Ver ordens de serviço'
    click_on 'KINZECARACTERES'
    #assert
    expect(page).to have_content "Atualizar status de entrega"
    expect(page).to have_field 'Local'
    expect(page).to have_field 'Descrição'
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

    vehicle = Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Yamaha',
                    model:'Fazer 250',
                    year:2020,
                    weight_capacity:100,
                    carrier:carrier)
    price = Price.create(size_min:0.6, size_max:1,
                        weight_min:0.1, weight_max:5,
                        km_value:0.75,carrier:carrier)
    deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)

    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('KINZECARACTERES')
    order = Order.create(customar_name:'Gabriel',customer_adress:'Rua do índio, mauá - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:48, track_number:'KINZECARACTERES',
                          product_number:'C3LUL4RT0P', size:0.8, weight:4 ,
                          carrier:carrier, vehicle:vehicle, status: 10)
    order.accepted!
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Stranding Logistics'
    click_on 'Ver ordens de serviço'
    click_on 'KINZECARACTERES'
    fill_in 'Local', with: 'Objeto Postado'
    fill_in 'Descrição', with: 'Em transito para retirada com o fornecedor'
    click_on 'Atualizar'
    #assert
    expect(page).to have_content 'Situação de entrega atualizada com sucesso'
  end


end