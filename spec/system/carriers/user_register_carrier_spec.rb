require 'rails_helper'

describe 'Usuário cadastra uma transporadora' do
  it 'a partir da tela inicial' do
    #arrange
    #act
    visit root_path
    click_on 'Cadastrar Transportadora'
    #assert
    expect(page).to have_field('Razão Social')
    expect(page).to have_field('CPNJ')
    expect(page).to have_field('Nome Fantasia')
    expect(page).to have_field('Endereço')
    expect(page).to have_field('Cidade')
    expect(page).to have_field('Estado')
    expect(page).to have_field('Domínio de E-mail')
  end

  it 'com sucesso' do
  end


end
