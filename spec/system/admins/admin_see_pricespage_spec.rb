require 'rails_helper'

describe 'Administrador vê tabela de preços' do
  it 'logado, a partir da página principal' do
    #arrange
    admin = Admin.create!(email:'jonathan@admin.com', password: 'password' )
    #act
    login(admin)
    click_on 'Tabelas de preços'
    #assert
    expect(current_path).to eq prices_path
    expect(page).to have_content 'Tabelas de preços:'
  end

end