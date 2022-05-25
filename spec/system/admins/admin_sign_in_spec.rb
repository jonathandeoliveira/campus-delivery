require 'rails_helper'

describe 'Usuário faz o login' do
  it 'com sucesso' do
    #arrange
    admin = Admin.create!(email:'jonathan@admin.com', password: 'password' )
    #act
    visit root_path
    click_on 'Trabalha conosco? Clique aqui'
    
    within('form') do
    fill_in 'E-mail', with: 'jonathan@admin.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    end
    
    #assert
    expect(page).to have_content 'Login efetuado com sucesso'
    within('nav') do
      expect(page).to have_content 'jonathan@admin.com'
      expect(page).not_to have_link 'Trabalha conosco? Clique aqui'
      expect(page).to have_button 'Sair'
    end
  end

  it 'e faz logout' do
    #arrange
    admin = Admin.create!(email:'jonathan@admin.com', password: 'password' )
    #act
    visit root_path
    click_on 'Trabalha conosco? Clique aqui'
    
    within('form') do
    fill_in 'E-mail', with: 'jonathan@admin.com'
    fill_in 'Senha', with: 'password'
    click_on 'Entrar'
    end
    click_on 'Sair'
    #assert
    expect(page).to have_content 'Logout efetuado com sucesso'
    expect(page).to have_link 'Entrar'
    expect(page).not_to have_button 'Sair'
    expect(page).not_to have_content 'jonathan@admin.com'
  end
end