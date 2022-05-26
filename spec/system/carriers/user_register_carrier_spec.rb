require 'rails_helper'

describe 'Usuário cadastra uma transporadora' do
  it 'a partir da tela inicial' do
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
    click_on 'Lista de Transportadoras'
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
    click_on 'Lista de Transportadoras'
    click_on 'Cadastrar Transportadora'
    #act
    fill_in 'Razão Social', with: 'LexCorp Incorporated'
    fill_in 'CPNJ', with: '85.732.736/0001-07'
    fill_in 'Nome Fantasia', with: 'LexCorp'
    fill_in 'Endereço', with:  'Av. Portugal, 1148'
    fill_in 'Cidade', with: 'Goiânia'
    fill_in 'Estado', with: 'GO'
    fill_in 'Domínio de E-mail', with: 'lexcorp.com'
    click_on 'Cadastrar'
    #assert
    expect(current_path).to eq carriers_path
    expect(page).to have_content 'Transportadora cadastrada com sucesso!'
    expect(page).to have_content 'LexCorp'
    expect(page).to have_content 'Goiânia - GO'
  end

  it 'Com dados incompletos e fora do formato' do
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
    click_on 'Cadastrar Transportadora'
    fill_in 'Razão Social', with: ''
    fill_in 'CPNJ', with: ''
    fill_in 'Nome Fantasia', with: ''
    click_on 'Cadastrar'
    #assert
    expect(page).to have_content "Razão Social não pode ficar em branco"
    expect(page).to have_content "CPNJ não pode ficar em branco"
    expect(page).to have_content "Nome Fantasia não pode ficar em branco"
    expect(page).to have_content 'CPNJ não possui o tamanho esperado' 
    expect(page).to have_content "CPNJ não é válido"
  end

end
