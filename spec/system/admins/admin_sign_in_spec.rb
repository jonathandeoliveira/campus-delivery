require 'rails_helper'

describe 'Usuário faz o login' do
  it 'com sucesso' do
    #arrange
    carrier = Carrier.create!(company_name:' Stark Logistics Inc', 
                              company_register:'00.178.762/0001-82',
                              brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                              city:'Tatuapé', state:'SP', 
                              email_domain:'@tstark.com', status: 1)
    Admin.create!(email:'email@email.com',password: 'password', carrier:carrier )
    #act
    visit root_path
    click_on 'Trabalha conosco? Clique aqui'
    
    within('form') do
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    end
    
    #assert
    expect(page).to have_content 'Login efetuado com sucesso'
    within('nav') do
      expect(page).to have_content 'email@email.com'
      expect(page).not_to have_link 'Trabalha conosco? Clique aqui'
      expect(page).to have_button 'Sair'
    end
  end

  it 'e faz logout' do
    #arrange
    carrier = Carrier.create!(company_name:' Stark Logistics Inc', 
                              company_register:'00.178.762/0001-82',
                              brand_name:'Stark Logistics', adress:'Rua Vilela, 663',
                              city:'Tatuapé', state:'SP', 
                              email_domain:'@tstark.com', status: 1)
    Admin.create!(email:'email@email.com',password: 'password', carrier:carrier )
    #act
    visit root_path
    click_on 'Trabalha conosco? Clique aqui'
    
    within('form') do
    fill_in 'E-mail', with: 'email@email.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    end
    click_on 'Sair'
    #assert
    expect(page).to have_content 'Logout efetuado com sucesso'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'email@email.com'
  end
end