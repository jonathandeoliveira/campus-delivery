require 'rails_helper'

describe 'vê as tabelas de preços das transportadoras' do
    it 'logado, a partir da página principal' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'@correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)
      user = User.create!(email:'jonathan@email.com', password: 'password', carrier_id: carrier )
      #act
      login_as(user)
      visit root_path
      click_on 'Tabelas de preços'
      #assert
      expect(page).to have_content 'Tabelas de preços:'
    end

    it 'com sucesso' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                      company_name:'Correios do Brasil', 
                      email_domain:'@correios.com',
                      company_register:'02.284.551/0001-50', 
                      city:'Brasília',
                      state: 'DF' ,
                      adress:'Edifício Sede dos Correios',
                      status:1)
      user = User.create!(email:'jonathan@email.com', password: 'password', carrier_id: carrier)
      Price.create(size_min:0.1, size_max:0.5,
                  weight_min:0.1, weight_max:5,
                  km_value:0.35,carrier:carrier)
      Price.create(size_min:0.6, size_max:1,
                  weight_min:0.1, weight_max:5,
                  km_value:0.75,carrier:carrier)

      #act
      login_as(user)
      visit root_path
      click_on 'Tabelas de preços'
      #assert
      expect(page).to have_content 'Intervalos de tamanho:'
      expect(page).to have_content '0.1 a 0.5 m³'
      expect(page).to have_content '0.6 a 1.0 m³'
      expect(page).to have_content 'Intervalos de peso:'
      expect(page).to have_content '0.1 a 5.0 Kg'
      expect(page).to have_content 'Valor por KM:'
      expect(page).to have_content 'Por R$0.35'
      expect(page).to have_content 'Por R$0.75'
    end

    it 'e não existem preços cadastrados' do
      #arrange
      carrier = Carrier.create!(brand_name:'Correios', 
                                  company_name:'Correios do Brasil', 
                                  email_domain:'@correios.com',
                                  company_register:'02.284.551/0001-50', 
                                  city:'Brasília',
                                  state: 'DF' ,
                                  adress:'Edifício Sede dos Correios',
                                  status:1)
      user = User.create!(email:'jonathan@email.com', password: 'password', carrier_id: carrier)
      #act
      login_as(user)
      visit root_path
      click_on 'Tabelas de preços'
      #assert
      expect(page).to have_content 'Não existem tabelas de preços cadastradas.'
    end

end