require 'rails_helper'

describe 'Usuário atualiza status uma ordem de serviço' do
  xit 'Aceita para em transito' do 
    #arrange
    cria transportadora
    cria veiculo
    cria preço
    cria prazo
    cria usuario
    cria uma ordem de serviço com status aceita
    #act
    faz o login como usuario
    acessa root_path
    clica  na lista de transportadoras
    clica na página da sua transportadora
    clica em ver ordens de serviço
    clica na ordem de serviço aceita
    clica em  em trasito
    #assert
    espera que a ordem de serviço esteja com status em transito
  end


  xit 'em transito para entregue' do 
    #arrange
    cria transportadora
    cria veiculo
    cria preço
    cria prazo
    cria usuario
    cria uma ordem de serviço com status em transito
    #act
    faz o login como usuario
    acessa root_path
    clica  na lista de transportadoras
    clica na página da sua transportadora
    clica em ver ordens de serviço
    clica na ordem de serviço em transito
    clica em entregue
    #assert
    espera que a ordem de serviço esteja com status entregue
  end
end