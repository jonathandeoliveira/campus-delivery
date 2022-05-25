require 'rails_helper'

describe 'Usuário cadastra um veiculo' do
  it 'a partir da home' do
    #arrange
    carrier = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)
    user = User.create!(email: 'luthor@lexcorp.com', password:'password', carrier:  carrier)
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'LexCorp'
    click_on 'Ver veículos cadastrados'
    click_on 'Cadastrar novo veículo'
    #assert
    expect(page).to have_content 'Cadastar novo veículo'
    expect(page).to have_field 'Placa'
    expect(page).to have_field 'Ano'
    expect(page).to have_field 'Marca'
    expect(page).to have_field 'Modelo'
    expect(page).to have_field 'Capacidade de carga'
  end

  it 'com sucesso' do
    #arrange
    carrier1 = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)

    carrier2 = Carrier.create!(company_name:' Stark Logistics Inc', 
                                company_register:'00.178.762/0001-82',
                                brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                                city:'Tatuapé', state:'SP', 
                                email_domain:'stark.com', status: 1)
    user = User.create!(email: 'tony@stark.com', password:'password', carrier: carrier2)
    #act
    login_as(user)
    #act
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Stark Logistics'
    click_on 'Ver veículos cadastrados'
    click_on 'Cadastrar novo veículo'
    fill_in 'Placa', with:'DYG-0246'
    fill_in 'Marca', with:'DAF'
    fill_in 'Modelo', with: 'XF105 FTT'
    fill_in 'Ano', with: '2017'
    fill_in 'Capacidade de carga', with: '4700'
    click_on 'Cadastrar'
    #assert
    expect(page).to have_content 'Veículo cadastrado com sucesso'
    expect(page).to have_content 'DYG-0246'
    expect(page).to have_content 'DAF'
    expect(page).to have_content 'XF105 FTT'
    expect(page).to have_content '2017'
    expect(page).to have_content '4700'
    expect(page).to have_content '4700'
  end

end