require 'rails_helper'

describe 'Usuário vê detalhes do veículo' do
  it 'à partir da tela inicial' do
    #arrange
    carrier = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'@lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)

    Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Ford',
                    model:'C-1419',
                    year:2016,
                    weight_capacity:7500,
                    carrier:carrier)

      Vehicle.create!(lincese_plate:'KCS-8503', 
                      brand:'Mercedes-Benz',
                      model:'Accelo 915',
                      year:2004,
                      weight_capacity:3200,
                      carrier:carrier)
    #act
    visit root_path
    click_on 'Todos os veículos' 
    click_on 'KDS-1342'
    #assert
    expect(page).to have_content('Dados do veículo:')
    expect(page).to have_content('Marca: Ford - Modelo: C-1419 - ano: 2016')
    expect(page).to have_content('Placa:KDS-1342 - Capacidade de carga:7500 kg')
    expect(page).to have_content('Pertence a transportadora: LexCorp')
  end

  it 'e volta para a tela de todos os veículos' do
    #arrange
    carrier = Carrier.create!(brand_name:'LexCorp', 
                              company_name:'LexCorp Incorporated', 
                              email_domain:'@lexcorp.com',
                              company_register:'85.732.736/0001-07', 
                              city:'Goiânia',
                              state: 'GO' ,
                              adress:'Av. Portugal, 1148',
                              status:1)

    Vehicle.create!(lincese_plate:'KDS-1342', 
                    brand:'Ford',
                    model:'C-1419',
                    year:2016,
                    weight_capacity:7500,
                    carrier:carrier)

      Vehicle.create!(lincese_plate:'KCS-8503', 
                      brand:'Mercedes-Benz',
                      model:'Accelo 915',
                      year:2004,
                      weight_capacity:3200,
                      carrier:carrier)
    #act
    visit root_path
    click_on 'Todos os veículos' 
    click_on 'KCS-8503'
    click_on 'Voltar'
    #assert
    expect(current_path).to eq vehicles_path
  end
end