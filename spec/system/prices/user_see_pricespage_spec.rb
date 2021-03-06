require 'rails_helper'

describe 'vê as tabelas de preços das transportadoras' do
    it 'usário comum, com sucesso e a partir da página principal' do
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
      Price.create(size_min:0.1, size_max:0.5,
                  weight_min:0.1, weight_max:5,
                  km_value:0.35,carrier:carrier)
      Price.create(size_min:0.6, size_max:1,
                  weight_min:0.1, weight_max:5,
                  km_value:0.75,carrier:carrier)

      #act
      login_as(user)
      visit root_path
      click_on 'Lista de Transportadoras'
      click_on 'Correios'
      #assert
      expect(page).to have_content 'Intervalos de tamanho:'
      expect(page).to have_content '0.10 a 0.50 m³'
      expect(page).to have_content '0.60 a 1.00 m³'
      expect(page).to have_content 'Intervalos de peso:'
      expect(page).to have_content '0.10 a 5.00 Kg'
      expect(page).to have_content 'Valor por KM:'
      expect(page).to have_content 'R$ 0,35'
      expect(page).to have_content 'R$ 0,75'
    end

    it 'e não existem preços cadastrados' do
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
      #assert
      expect(page).to have_content 'Não existem tabelas de preços cadastradas.'
    end
end