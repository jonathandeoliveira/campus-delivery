require 'rails_helper'

describe 'Administrador vê tabela de preços' do
  it 'logado, a partir da página principal' do
    #arrange
    admin = Admin.create!(email:'jonathan@admin.com', password: 'password' )
    #act
    visit root_path
    click_on 'Trabalha conosco? Clique aqui'
    fill_in 'E-mail', with: 'jonathan@admin.com'
    fill_in 'Senha', with: 'password'
    within('form') do
    click_on 'Entrar'
    end
    click_on 'Tabelas de preços'
    #assert
    expect(current_path).to eq prices_path
    expect(page).to have_content 'Tabelas de preços:'
  end

end