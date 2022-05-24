require 'rails_helper'

describe 'Usuário se cadastra' do
  it 'com sucesso' do
    #arrange
    carrier = Carrier.create!(brand_name:'LexCorp', 
      company_name:'LexCorp Incorporated', 
      email_domain:'lexcorp.com',
      company_register:'85.732.736/0001-07', 
      city:'Goiânia',
      state: 'GO' ,
      adress:'Av. Portugal, 1148',
      status:1)

    #act
    visit root_path
    click_on 'Entrar'
    click_on 'Cadastrar'
    fill_in 'E-mail', with: 'luthor@lexcorp.com'
    fill_in 'Senha', with: 'password'
    fill_in 'Confirme sua senha', with: 'password'
    click_on 'Cadastrar'
    #assert
    expect(page).to have_content 'Boas vindas! Você realizou seu registro com sucesso.'
    expect(page).to have_content 'luthor@lexcorp.com'
    expect(page).to have_button 'Sair'
    user = User.last
    expect(user.carrier_id).to eq 1
  end
end