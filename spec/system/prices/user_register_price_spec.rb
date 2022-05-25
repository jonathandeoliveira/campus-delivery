require 'rails_helper'

describe 'Usuário registra um preço' do
  it 'a partir da homepage' do 
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
                              company_name:'Correios do Brasil', 
                              email_domain:'correios.com',
                              company_register:'02.284.551/0001-50', 
                              city:'Brasília',
                              state: 'DF' ,
                              adress:'Edifício Sede dos Correios',
                              status:1)
    user = User.create!(email:'jonathan@correios.com', password: 'password', carrier: carrier)
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Correios'
    click_on 'Cadastrar novo preço'
    #assert
    expect(page).to have_field 'Tamanho mínimo'
    expect(page).to have_field 'Tamanho máximo'
    expect(page).to have_field 'Peso mínimo'
    expect(page).to have_field 'Peso máximo'
    expect(page).to have_field 'Valor por quilômetro'
  end

  it 'com sucesso' do 
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
                              company_name:'Correios do Brasil', 
                              email_domain:'correios.com',
                              company_register:'02.284.551/0001-50', 
                              city:'Brasília',
                              state: 'DF' ,
                              adress:'Edifício Sede dos Correios',
                              status:1)
    user = User.create!(email:'jonathan@correios.com', password: 'password', carrier: carrier)
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Correios'
    click_on 'Cadastrar novo preço'
    fill_in 'Tamanho mínimo' , with: '1.01'
    fill_in 'Tamanho máximo' , with: '1.50'
    fill_in 'Peso mínimo' , with: '5.01'
    fill_in 'Peso máximo' , with: '10.00'
    fill_in 'Valor por quilômetro' , with: '3.00'
    click_on 'Cadastrar'
    #assert
    #expect(current_path).to eq prices_path
    expect(page).to have_content 'Intervalos de tamanho:'
    expect(page).to have_content '1.01 a 1.50 m³'
    expect(page).to have_content 'Intervalos de peso:'
    expect(page).to have_content '5.01 a 10.00 Kg'
    expect(page).to have_content 'Valor por KM:'
    expect(page).to have_content 'R$ 3,00'
  end

end