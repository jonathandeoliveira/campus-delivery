require 'rails_helper'

describe 'Usuário cadastra um prazo' do
  it 'a partir da página da transportadora' do 
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
    user = User.create!(email:'robson@correios.com', password: 'password', carrier:carrier )
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Correios'
    #assert
    expect(page).to have_content "Prazos para entrega:"
    expect(page).to have_content 'Cadastrar novo prazo'
  end

  it 'a partir da página da transportadora' do 
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
    user = User.create!(email:'robson@correios.com', password: 'password', carrier:carrier )
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Correios'
    click_on 'Cadastrar novo prazo'
    #assert
    expect(page).to have_field 'Distância mínima'
    expect(page).to have_field 'Distância máxima'
    expect(page).to have_field 'Prazo para a distância'
    expect(page).to have_field 'Transportadora'
  end

end