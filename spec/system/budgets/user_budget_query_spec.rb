require 'rails_helper'

describe 'Usuário consulta preços' do
  it 'a partir da página principal' do
    #arrange
    admin = Admin.create!(email:'larissa@admin.com', password: 'password' )
    #act
    login_as admin, scope: :admin
    visit root_path
    click_on 'Consultar orçamento'
    #assert
    expect(current_path).to eq budgets_path
    expect(page).to have_content 'Consulta de orçamento:'
    expect(page).to have_field 'Altura'
    expect(page).to have_field 'Largura'
    expect(page).to have_field 'Comprimento'
    expect(page).to have_field 'Peso'
    expect(page).to have_field 'Distância'
  end

  it 'preenche o formulário e é redirecionado' do
    #arrange
    admin = Admin.create!(email:'larissa@admin.com', password: 'password' )
    carrier = Carrier.create!(company_name:' Stark Logistics Inc', 
                              company_register:'00.178.762/0001-82',
                              brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                              city:'Tatuapé', state:'SP', 
                              email_domain:'stark.com', status: 1)
    price = Price.create(size_min:0.1, size_max:0.5,
                  weight_min:25, weight_max:50,
                  km_value:0.65,carrier:carrier)
    deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)
    #act
    login_as admin, scope: :admin
    visit root_path
    click_on 'Consultar orçamento'
    fill_in 'Altura', with: '1'
    fill_in 'Largura', with: '0.8'
    fill_in 'Comprimento', with: '0.35'
    fill_in 'Peso', with: '48'
    fill_in 'Distância', with:'74'
    click_on 'Buscar'
    #assert
    expect(current_path).to eq budget_path(Budget.last)
  end

  it 'Com sucesso:' do
    #arrange
    admin = Admin.create!(email:'larissa@admin.com', password: 'password' )
    carrier = Carrier.create!(company_name:'Stark Logistics Inc', 
                              company_register:'00.178.762/0001-82',
                              brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                              city:'Tatuapé', state:'SP', 
                              email_domain:'stark.com', status: 1)
    price = Price.create(size_min:0.1, size_max:0.5,
                  weight_min:25, weight_max:50,
                  km_value:0.65,carrier:carrier)
    deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)

    
    carrier2 = Carrier.create!(brand_name:'Stranding Logistics', 
                                company_name:'Kojima H. Entregas Inc', 
                                email_domain:'dslog.com',
                                company_register:'01.345.140/0001-64', 
                                city:'São Bernardo do Campo',
                                state: 'SP' ,
                                adress:'Rua jônio, 66',
                                status:1)

    price2 = Price.create(size_min:0.1, size_max:0.5,
                  weight_min:25, weight_max:50,
                  km_value:0.80,carrier:carrier2)

    deadline2 = Deadline.create!(km_min:0, km_max:80, km_time:2, carrier:carrier2)

    #act
    login_as admin, scope: :admin
    visit root_path
    click_on 'Consultar orçamento'
    fill_in 'Altura', with: '1'
    fill_in 'Largura', with: '0.8'
    fill_in 'Comprimento', with: '0.35'
    fill_in 'Peso', with: '48'
    fill_in 'Distância', with:'74'
    click_on 'Buscar'

    #assert
    expect(page).to have_content 'Orçamentos obtidos:'
    expect(page).to have_content 'Transportadora:'
    expect(page).to have_content 'Stark Logistics'
    expect(page).to have_content 'Stranding Logistics'
    expect(page).to have_content 'Prazo de entrega:'
    expect(page).to have_content '1'
    expect(page).to have_content '2'
    expect(page).to have_content 'Valor do frete:'
    expect(page).to have_content 'R$ 48,10'
    expect(page).to have_content 'R$ 59,20'
  end

  it 'E não encontra um orçamento para os dados inseridos' do
    #arrange
    admin = Admin.create!(email:'larissa@admin.com', password: 'password' )
    carrier = Carrier.create!(company_name:'Stark Logistics Inc', 
                              company_register:'00.178.762/0001-82',
                              brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                              city:'Tatuapé', state:'SP', 
                              email_domain:'stark.com', status: 1)
    price = Price.create(size_min:0.1, size_max:0.5,
                  weight_min:25, weight_max:50,
                  km_value:0.65,carrier:carrier)
    deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)

    
    carrier2 = Carrier.create!(brand_name:'Stranding Logistics', 
                                company_name:'Kojima H. Entregas Inc', 
                                email_domain:'dslog.com',
                                company_register:'01.345.140/0001-64', 
                                city:'São Bernardo do Campo',
                                state: 'SP' ,
                                adress:'Rua jônio, 66',
                                status:1)

    price2 = Price.create(size_min:0.1, size_max:0.5,
                  weight_min:25, weight_max:50,
                  km_value:0.80,carrier:carrier2)

    deadline2 = Deadline.create!(km_min:0, km_max:80, km_time:2, carrier:carrier2)

    #act
    login_as admin, scope: :admin
    visit root_path
    click_on 'Consultar orçamento'
    fill_in 'Altura', with: '9'
    fill_in 'Largura', with: '18'
    fill_in 'Comprimento', with: '35'
    fill_in 'Peso', with: '48'
    fill_in 'Distância', with:'74'
    click_on 'Buscar'

    #assert
    expect(page).to have_content 'Não foi encontrado nenhum orçamento para estes dados'
 
    end




end