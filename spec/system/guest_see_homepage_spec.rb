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
    #act
    visit root_path
    click_on 'Lista de Transportadoras'
    #assert
    expect(current_path).to eq carriers_path
    expect(page).to have_content 'Entre para acessar sua transportadora.'

  end

end