require 'rails_helper'

describe 'Usuário atualiza status uma ordem de serviço' do
  it 'A partir de sua transportadora, vê todas ordens de serviço' do 
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

    order = Order.new(customar_name:'Douglas',customer_adress:'Rua dos condomínios, Santo André - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:12, track_number:'KINZECARACTERES',
                          product_number:'N0T3B00K-G4M3R', size:0.8, weight:4 ,
                          carrier:carrier, vehicle:vehicle, status: 20)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('KINZECARACTERES')
    order.save

    user = User.create!(email:'luthor@lexcorp.com', password:'password', carrier:carrier)
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'LexCorp'
    click_on 'Ver ordens de serviço'
    #assert
    expect(page).to have_content 'Código de rastreio:'
    expect(page).to have_content 'KINZECARACTERES'
    expect(page).to have_content 'Transportadora:'
    expect(page).to have_content 'LexCorp'
    expect(page).to have_content 'Status'
    expect(page).to have_content 'accepted'
  end

  it 'vê o detalhes de uma ordem de serviço' do 
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

    order = Order.new(customar_name:'Douglas',customer_adress:'Rua dos condomínios, Santo André - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:12, track_number:'KINZECARACTERES',
                          product_number:'N0T3B00K-G4M3R', size:0.8, weight:4 ,
                          carrier:carrier, vehicle:vehicle, status: 20)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('KINZECARACTERES')
    order.save

    user = User.create!(email:'luthor@lexcorp.com', password:'password', carrier:carrier)
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'LexCorp'
    click_on 'Ver ordens de serviço'
    click_on 'KINZECARACTERES'
    #assert
    expect(page).to have_content 'Nome do cliente: Douglas'
    expect(page).to have_content 'Código do produto: N0T3B00K-G4M3R'
    expect(page).to have_content 'Veículo designado: Ford/C-1419/2016- Placa:KDS-1342 - Capacidade de carga: 7500Kg'
    expect(page).to have_content 'Endereço de retirada: Paço municial, santo andré - SP'
    expect(page).to have_content 'Endereço de entrega: Rua dos condomínios, Santo André - SP'
    expect(page).to have_content 'Distância: 12 Km'
    expect(page).to have_content 'Peso: 4.0 Kg'
    expect(page).to have_content 'Status: accepted'
    expect(page).to have_button 'Em transito'
  end

  it 'Muda ordem para em transito' do 
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

    order = Order.new(customar_name:'Douglas',customer_adress:'Rua dos condomínios, Santo André - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:12, track_number:'KINZECARACTERES',
                          product_number:'N0T3B00K-G4M3R', size:0.8, weight:4 ,
                          carrier:carrier, vehicle:vehicle, status: 20)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('KINZECARACTERES')
    order.save

    user = User.create!(email:'luthor@lexcorp.com', password:'password', carrier:carrier)
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'LexCorp'
    click_on 'Ver ordens de serviço'
    click_on 'KINZECARACTERES'
    click_on 'Em transito'

    #assert
    expect(page).to have_content 'Ordem atualizada com sucesso'
    expect(page).to have_content 'Nome do cliente: Douglas'
    expect(page).to have_content 'Código do produto: N0T3B00K-G4M3R'
    expect(page).to have_content 'Veículo designado: Ford/C-1419/2016- Placa:KDS-1342 - Capacidade de carga: 7500Kg'
    expect(page).to have_content 'Endereço de retirada: Paço municial, santo andré - SP'
    expect(page).to have_content 'Endereço de entrega: Rua dos condomínios, Santo André - SP'
    expect(page).to have_content 'Distância: 12 Km'
    expect(page).to have_content 'Peso: 4.0 Kg'
    expect(page).to have_content 'Status: in_transit'
  end

  it 'Atualiza status para entregue' do 
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

    order = Order.new(customar_name:'Douglas',customer_adress:'Rua dos condomínios, Santo André - SP',
                          derparture_adress:'Paço municial, santo andré - SP',
                          distance:12, track_number:'KINZECARACTERES',
                          product_number:'N0T3B00K-G4M3R', size:0.8, weight:4 ,
                          carrier:carrier, vehicle:vehicle, status: 30)
    allow(SecureRandom).to receive(:alphanumeric).with(15).and_return('KINZECARACTERES')
    order.save

    user = User.create!(email:'luthor@lexcorp.com', password:'password', carrier:carrier)
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'LexCorp'
    click_on 'Ver ordens de serviço'
    click_on 'KINZECARACTERES'
    click_on 'Entregue'

    #assert
    expect(page).to have_content 'Ordem atualizada com sucesso'
    expect(page).to have_content 'Nome do cliente: Douglas'
    expect(page).to have_content 'Código do produto: N0T3B00K-G4M3R'
    expect(page).to have_content 'Veículo designado: Ford/C-1419/2016- Placa:KDS-1342 - Capacidade de carga: 7500Kg'
    expect(page).to have_content 'Endereço de retirada: Paço municial, santo andré - SP'
    expect(page).to have_content 'Endereço de entrega: Rua dos condomínios, Santo André - SP'
    expect(page).to have_content 'Distância: 12 Km'
    expect(page).to have_content 'Peso: 4.0 Kg'
    expect(page).to have_content 'Status: delivered'
  end
end