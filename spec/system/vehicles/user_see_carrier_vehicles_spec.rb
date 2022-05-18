require 'rails_helper'

describe 'Usuário vê veículos cadastrados' do
  it 'a partir da home' do
    #arrange
    carrier = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'@lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)
    #act
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'LexCorp'
    click_on 'Ver veículos cadastrados'
    #assert
    expect(current_path).to eq vehicles_path
  end

  it 'e não existem veículos cadastrados' do
    #arrange
    carrier = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'@lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)
    #act
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'LexCorp'
    click_on 'Ver veículos cadastrados'
    #assert
    expect(current_path).to eq vehicles_path
    expect(page).to have_content 'Não existem veículos cadastrados'
  end

  it 'com sucesso' do
    #arrange
    carrier = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'@lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)

    Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Ford',
                    model:'C-1419',
                    year:2016,
                    weight_capacity:7500,
                    carrier:carrier)

    Vehicle.create!(lincese_plate:'KCS-8503', 
                      brand:'Mercedes-Benz',
                      model:'Accelo 915',
                      year:2004,
                      weight_capacity:3200,
                      carrier:carrier)
    #act
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'LexCorp'
    click_on 'Ver veículos cadastrados'
    #assert
    expect(page).to have_content 'KCS-8503'
    expect(page).to have_content 'KDS-1342'
    expect(page).to have_content 'Accelo 915'
    expect(page).to have_content 'C-1419'
    expect(page).to have_content '3200'
    expect(page).to have_content '7500'
  end

end