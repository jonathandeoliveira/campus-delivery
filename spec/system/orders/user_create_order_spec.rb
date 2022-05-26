require 'rails_helper'

describe 'Usuário cria ordem de serviço' do
  it 'acessando a página, a partir do menu' do
    #arrange
   
    #act
    visit root_path
    click_on 'Ordens de serviço'
    click_on 'Criar ordem de serviço'
    #assert
    expect(page).to have_field  'Transportadora'
    expect(page).to have_field  'Tamanho'
    expect(page).to have_field  'Peso'
    expect(page).to have_field  'Endereço de retirada'
    expect(page).to have_field  'Endereço de entrega'
    expect(page).to have_field  'Distância'
    expect(page).to have_field  'Código do produto'
  end

  it 'com sucesso' do
    #arrange
    carrier1 = Carrier.create!(brand_name:'Correios', 
                                company_name:'Correios do Brasil', 
                                email_domain:'correios.com',
                                company_register:'02.284.551/0001-50', 
                                city:'Brasília',
                                state: 'DF' ,
                                adress:'Edifício Sede dos Correios',
                                status:1)

    carrier2 = Carrier.create!(company_name:' Stark Logistics Inc', 
                                  company_register:'00.178.762/0001-82',
                                  brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                                  city:'Tatuapé', state:'SP', 
                                  email_domain:'stark.com', status: 1)

    #act
    visit root_path
    click_on 'Ordens de serviço'
    click_on 'Criar ordem de serviço'
    select 'Stark Logistics' , from: 'Transportadora'
    fill_in 'Endereço de retirada' , with: 'Rua da retirada,200 - SP'
    fill_in 'Nome do cliente' , with: 'Joao das Encomendas'
    fill_in 'Endereço de entrega' , with: 'Rua das entregas,123 - SP'
    fill_in 'Distância' , with: '70'
    fill_in 'Peso' , with: '2.8'
    fill_in 'Tamanho' , with: '0.9'
    fill_in 'Código do produto' , with: 'F0N3D30UV1D0'
    click_on 'Cadastrar'
    #assert
    expect(page).to have content 'Pedido registrado com sucesso'
  end

end