require 'rails_helper'

describe 'Usuário cria ordem de serviço' do
  it 'acessando a página, a partir do menu' do
    #arrange
   
    #act
    visit root_path
    click_on 'Ordens de serviço'
    #assert
    expect(current_path).to eq orders_path
    expect(page).to have_content 'Lista de ordens de serviço'
  end


end