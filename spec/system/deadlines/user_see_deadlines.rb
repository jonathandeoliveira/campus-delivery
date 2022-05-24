require 'rails_helper'
describe 'Usuário visualiza a lista de prazos' do
  it 'a partir dos detalhes da transportadora' do
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
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
    #assert
    expect(page).to have_content "Prazos para entrega:"
  end

  it 'e vê tabela de prazos' do
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
                              company_name:'Correios do Brasil', 
                              email_domain:'@correios.com',
                              company_register:'02.284.551/0001-50', 
                              city:'Brasília',
                              state: 'DF' ,
                              adress:'Edifício Sede dos Correios',
                              status:1)
    Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)
    Deadline.create!(km_min:81, km_max:160, km_time:3, carrier:carrier)
    Deadline.create!(km_min:161, km_max:240, km_time:5, carrier:carrier)
    #act
      visit root_path
      click_on 'Lista de Transportadoras'
      click_on 'Correios'
    #assert
    expect(page).to have_content 'Prazos para entrega:'
    expect(page).to have_content 'Intervalos de distância:'
    expect(page).to have_content 'Tempo estimado para entrega:'
    expect(page).to have_content '0 a 80 Km | 1 Dia(s)'
    expect(page).to have_content '81 a 160 Km | 3 Dia(s)'
    expect(page).to have_content '161 a 240 Km | 5 Dia(s)'
  end

  it 'e não há prazos cadastrados' do
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
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
    #assert
    expect(page).to have_content 'Prazos para entrega:'
    expect(page).to have_content 'Não existem prazos cadastrados.'
  end
end