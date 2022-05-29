class CarriersController < ApplicationController
  before_action :autenticate, only: [:show]
  before_action :acess_validation, only: [:show]
  def index
    @carriers = Carrier.all
  end

  def new
    @carrier = Carrier.new
  end

  def show
    @carrier = Carrier.find(params[:id])
    @deadlines = @carrier.deadlines.order(km_time: :asc)
    @prices = @carrier.prices.order(km_value: :asc)
    @order = @carrier.orders
  end

  def create
    @carrier = Carrier.new(carrier_params)
    if @carrier.save
      redirect_to carriers_path, notice: 'Transportadora cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Erro! Não foi possível cadastrar uma nova transportadora'
      render 'new' 
    end
  end

  def edit
    @carrier = current_user.carrier
  end

  def update
    @carrier = current_user.carrier
    if  @carrier.update(carrier_params)
      return redirect_to carrier_path(@carrier.id), notice:'Transportadora atualizada com sucesso'
    else 
      flash.now[:notice] = 'Não foi possível atualizar a transportadora'
      render 'edit'
    end
  end

  def activate
    @carrier =  Carrier.find(params[:id])
    @carrier.active!
    redirect_to carriers_path, notice: 'Transportadora ativada com sucesso'
  end

  def desactivate
    @carrier =  Carrier.find(params[:id])
    @carrier.desactive!
    redirect_to carriers_path, notice: 'Transportadora ativada com sucesso'
  end


  private

  def carrier_params
    params.require(:carrier).permit(:company_name, :company_register,
                                    :brand_name, :city, :state, :adress,
                                    :email_domain, :status)
  end
end
