require 'rails_helper'

describe 'Usuário consulta preços' do
  xit 'a partir da página principal' do
    #arrange
    admin = Admin.create!(email:'larissa@admin.com', password: 'password' )
    carrier = Carrier.create!(company_name:' Stark Logistics Inc', 
                              company_register:'00.178.762/0001-82',
                              brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                              city:'Tatuapé', state:'SP', 
                              email_domain:'stark.com', status: 1)
    price = Price.create(size_min:0.1, size_max:0.5,
                  weight_min:0.1, weight_max:5,
                  km_value:0.35,carrier:carrier)
    deadline = Deadline.create!(km_min:0, km_max:80, km_time:1, carrier:carrier)
    #act
    login_as(admin)
    click_on 'Consultar orçamento'
    #assert
    expect(current_path).to eq budget_carriers_path
  end

  xit 'com sucesso' do
    #arrange
    cria um adm
    cria uma transportadora
    cria um preço
    cria um prazo
    #act
    adm vista root_path
    clica em orçamentos
    preenche o formulário
    clica em consultar
    #assert
    adm vê os orçamentos
  end

end