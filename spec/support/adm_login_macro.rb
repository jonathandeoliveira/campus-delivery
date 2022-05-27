def login(admin)
  visit root_path
  click_on 'Trabalha conosco? Clique aqui'
  fill_in 'E-mail', with: 'jonathan@admin.com'
  fill_in 'Senha', with: 'password'
  within('form') do
    click_on 'Entrar'
  end
end