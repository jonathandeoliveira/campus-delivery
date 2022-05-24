require 'rails_helper'

describe 'Usuário faz o login' do
  it 'com sucesso' do
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
                              company_name:'Correios do Brasil', 
                              email_domain:'correios.com',
                              company_register:'02.284.551/0001-50', 
                              city:'Brasília',
                              state: 'DF' ,
                              adress:'Edifício Sede dos Correios',
                              status:1)
    User.create!(email:'robson@correios.com', password: 'password', carrier:carrier )
    #act
    visit root_path
    click_on 'Entrar'
    
    within('form') do
    fill_in 'E-mail', with: 'robson@correios.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    end
    
    #assert
    expect(page).to have_content 'Login efetuado com sucesso'
    within('nav') do
      expect(page).to have_content 'robson@correios.com'
      expect(page).not_to have_link 'Entrar'
      expect(page).to have_button 'Sair'
    end
  end

  it 'e faz logout' do
    #arrange
    carrier = Carrier.create!(brand_name:'Correios', 
                              company_name:'Correios do Brasil', 
                              email_domain:'correios.com',
                              company_register:'02.284.551/0001-50', 
                              city:'Brasília',
                              state: 'DF' ,
                              adress:'Edifício Sede dos Correios',
                              status:1)
    User.create!(email:'robson@correios.com', password: 'password', carrier: carrier )
    #act
    visit root_path
    click_on 'Entrar'
    
    within('form') do
    fill_in 'E-mail', with: 'robson@correios.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    end
    click_on 'Sair'
    #assert
    expect(page).to have_content 'Logout efetuado com sucesso'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'robson@correios.com'
  end
end