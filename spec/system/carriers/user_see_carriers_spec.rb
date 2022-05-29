require 'rails_helper'

describe 'Usuario visita a tela de transportadoras' do
  it 'e vê as transportadoras cadastradas' do
    #arrange
    carrier = Carrier.create(brand_name:'Wayne Express', 
                  company_name:'Wayne Enterprises Inc', 
                  email_domain:'wayne.com',
                  company_register:'70.190.836/0001-81', 
                  city:'Rio de Janeiro',
                  state: 'RJ' ,
                  adress:'Avenida Almirante Barroso, 81',
                  status:1)
    user = User.create!(email:'batman@wayne.com',password:'password',carrier:carrier)
    #act
    login_as(user)
    visit root_path
    click_on 'Lista de Transportadoras'
    #assert
    expect(page).to have_content 'Wayne Express'
    expect(page).to have_content '@wayne.com'
    expect(page).to have_content 'Rio de Janeiro - RJ'
  end

  it 'e não existem transportadoras cadastradas' do
    #arrange
    admin = Admin.create!(email:'jonathan@admin.com',password:'password')
    #act
    login_as admin, scope: :admin
    visit root_path
    click_on 'Lista de Transportadoras'

    #assert
    expect(page).to have_content 'Não existem transportadoras cadastradas'
  end

end