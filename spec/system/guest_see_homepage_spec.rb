require 'rails_helper'

describe 'Usuario visita a tela inical' do
  it 'e vê o nome da app' do
    #arrange
    #act
    visit root_path
    #assert
    expect(page).to have_content('Olá, Bem vindo à CC-Delivery')
  end

  it 'e acessa a página de transportadoras cadastradas' do
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
    click_on 'Lista de Transportadoras'
    #assert
    expect(current_path).to eq carriers_path
    expect(page).to have_content 'Wayne Express'
    expect(page).to have_content '@wayne.com'
    expect(page).to have_content 'Rio de Janeiro - RJ'
  end

end