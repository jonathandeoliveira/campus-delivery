require 'rails_helper'

describe 'Usuario visita a tela inical' do
  it 'e vê o nome da app' do
    #arrange
    #act
    visit root_path
    #assert
    expect(page).to have_content('Olá, Bem vindo à CC-Delivery')
  end

end