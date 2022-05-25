class PricesController < ApplicationController
  before_action :authenticate_user! , only: [:new, :create]
  before_action :authenticate_admin! , only: [:index]

  def index
    @prices = Price.all.order(km_value: :asc)
  end

  def new
    @carrier = current_user.carrier
    @price = Price.new
  end

 def create
    price_params = params.require(:price).permit(:size_min,:size_max,:weight_min,:weight_max,:km_value)
    @price = Price.new(price_params)
    @price.carrier = current_user.carrier
    if @price.save!
      redirect_to current_user.carrier, notice: 'Preço cadastrado com sucesso'
   else
      flash.now[:notice] = 'Não foi possível cadastrar o preço'
      render 'new'
   end
 end

end
