require 'rails_helper'

describe 'Usuário edita uma transportadora' do
  it 'a partir da página de detalhes' do
    #arrange
    Carrier.create!(brand_name:'Correios', 
                    company_name:'Correios do Brasil', 
                    email_domain:'@correios.com',
                    company_register:'02.284.551/0001-50', 
                    city:'Brasília',
                    state: 'DF' ,
                    adress:'Edifício Sede dos Correios',
                    status:1)
    #act
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Correios'
    click_on 'Editar'
    #assert
    expect(page).to have_field 'Razão Social', with:'Correios do Brasil'
    expect(page).to have_field 'CPNJ', with: '02.284.551/0001-50'
    expect(page).to have_field 'Nome Fantasia', with:'Correios'
    expect(page).to have_field 'Endereço', with:'Edifício Sede dos Correios'
    expect(page).to have_field 'Cidade', with:'Brasília'
    expect(page).to have_field 'Estado', with:'DF'
    expect(page).to have_field 'Domínio de E-mail', with:'@correios.com'
  end

  it 'com sucesso' do
    #arrange
    Carrier.create!(brand_name:'Correios', 
                    company_name:'Correios do Brasil', 
                    email_domain:'@correios.com',
                    company_register:'02.284.551/0001-50', 
                    city:'Brasília',
                    state: 'DF' ,
                    adress:'Edifício Sede dos Correios',
                    status:1)
    #act
    visit root_path
    click_on 'Lista de Transportadoras'
    click_on 'Correios'
    click_on 'Editar'
    fill_in 'Nome Fantasia', with: 'Sedex'
    fill_in 'Domínio de E-mail', with: '@sedex.com'
    click_on 'Salvar'
    #assert
    expect(page).to have_content 'Transportadora atualizada com sucesso'
    expect(page).to have_content 'Detalhes sobre a transportadora: Sedex'
    expect(page).to have_content 'Domínio de E-mail: @sedex.com'
  end

  it 'e mantém os campos obrigatórios' do
  #arrange
  Carrier.create!(brand_name:'Correios', 
                  company_name:'Correios do Brasil', 
                  email_domain:'@correios.com',
                  company_register:'02.284.551/0001-50', 
                  city:'Brasília',
                  state: 'DF' ,
                  adress:'Edifício Sede dos Correios',
                  status:1)
  #act
      #act
      visit root_path
      click_on 'Lista de Transportadoras'
      click_on 'Correios'
      click_on 'Editar'
      fill_in 'Nome Fantasia', with: ''
      fill_in 'Domínio de E-mail', with: ''
      click_on 'Salvar'
  #assert
  expect(page).to have_content 'Não foi possível atualizar a transportadora'

  end

end