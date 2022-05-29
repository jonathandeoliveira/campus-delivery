require 'rails_helper'

describe 'Visitante rastreia seu pedido' do
  it 'a partir da página principal' do
    #arrange
    #act
    visit root_path
    #assert
    expect(page).to have_content 'Rastreie seu pedido'
    expect(page).to have_field 'Código de rastreio'
    expect(page).to have_button 'Buscar'

  end

  it 'com sucesso, sem atualizações de rota' do
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
    #act
    visit root_path
    fill_in 'Código de rastreio', with: order.track_number
    click_on 'Buscar'
    #assert
    expect(page).to have_content "Resultado da busca por: #{order.track_number}"
    expect(page).to have_content 'Nome do cliente: Douglas'
    expect(page).to have_content 'Endereço de entrega: Rua dos condomínios, Santo André - SP'
    expect(page).to have_content "Transportadora: LexCorp"
    expect(page).to have_content 'Código do produto: N0T3B00K-G4M3R'
    expect(page).to have_content "Prazo de entrega: #{order.delivery_deadline} Dia(s) úteis"
    expect(page).to have_content 'Situação da entrega:'
    expect(page).to have_content 'Não existem atualizações de entrega para este pedido'
    expect(page).to have_content 'Novo rastreio:'
    expect(page).to have_field 'Código de rastreio'
    expect(page).to have_button 'Buscar'
  end

  it 'com sucesso, com atualizações de rota' do
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
    delivery_update = DeliveryUpdate.create!(order: order, coord_position:'CDD Santo André' ,delivery_description: 'Objeto chegou ao centro de destribuição' )
    #act
    visit root_path
    fill_in 'Código de rastreio', with: order.track_number
    click_on 'Buscar'
    #assert
    expect(page).to have_content "Resultado da busca por: #{order.track_number}"
    expect(page).to have_content 'Nome do cliente: Douglas'
    expect(page).to have_content 'Endereço de entrega: Rua dos condomínios, Santo André - SP'
    expect(page).to have_content "Transportadora: LexCorp"
    expect(page).to have_content 'Código do produto: N0T3B00K-G4M3R'
    expect(page).to have_content "Prazo de entrega: #{order.delivery_deadline} Dia(s) úteis"
    expect(page).to have_content 'Situação da entrega:'
    expect(page).to have_content 'Local:'
    expect(page).to have_content 'Descrição:'
    expect(page).to have_content 'Horário de atualização:'
    expect(page).to have_content 'CDD Santo André'
    expect(page).to have_content 'Objeto chegou ao centro de destribuição'
    expect(page).to have_content "#{I18n.l(delivery_update.created_at, format: :long)}"
    expect(page).to have_content 'Novo rastreio:'
    expect(page).to have_field 'Código de rastreio'
    expect(page).to have_button 'Buscar'
  end

  it 'e código não existe' do
    #arrange
    #act
    visit root_path
    fill_in 'Código de rastreio', with: 'DAS3123HLK9SAUJD'
    click_on 'Buscar'
    #assert

    expect(page).to have_content 'Resultado da busca por: DAS3123HLK9SAUJD'
    expect(page).to have_content 'Não foi encontrado nenhum pedido com este código'
    expect(page).to have_content 'Novo rastreio:'
    expect(page).to have_field 'Código de rastreio'
    expect(page).to have_button 'Buscar'

  end

end