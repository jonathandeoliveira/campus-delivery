require 'rails_helper'

describe 'Usuário vê detalhes de uma transportadora' do
  it 'e vê informações adicionais' do
    #arrange
    Carrier.create(brand_name:'Wayne Express', 
                  company_name:'Wayne Enterprises Inc', 
                  email_domain:'@wayne.com',
                  company_register:'70.190.836/0001-81', 
                  city:'Rio de Janeiro',
                  state: 'RJ' ,
                  adress:'Avenida Almirante Barroso, 81',
                  status:1)
    #act
    visit(root_path)
    click_on 'Wayne Express'

    #assert
    expect(page).to have_content 'Detalhes sobre a transportadora: Wayne Express'
    expect(page).to have_content 'Wayne Enterprises Inc'
    expect(page).to have_content 'Endereço de faturamento: Avenida Almirante Barroso, 81 - Rio de Janeiro - RJ'
    expect(page).to have_content 'Domínio de E-mail: @wayne.com'
  end

  it 'e volta para a tela inicial' do
    #arrange
    Carrier.create(brand_name:'Wayne Express', 
                  company_name:'Wayne Enterprises Inc', 
                  email_domain:'@wayne.com',
                  company_register:'70.190.836/0001-81', 
                  city:'Rio de Janeiro',
                  state: 'RJ' ,
                  adress:'Avenida Almirante Barroso, 81',
                  status:1)
    #act
    visit root_path
    click_on 'Wayne Express'
    click_on 'Voltar'
    #assert
    expect(current_path).to eq root_path
  end

end