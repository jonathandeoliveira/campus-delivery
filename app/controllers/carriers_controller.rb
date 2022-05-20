class CarriersController < ApplicationController

  def index
    @carriers= Carrier.all
  end

  def new
    @carrier = Carrier.new
  end

  def show
    @carrier = Carrier.find(params[:id])
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
    @carrier = Carrier.find(params[:id])
  end

  def update
    @carrier = Carrier.find(params[:id])
    if  @carrier.update(carrier_params)
      return redirect_to carrier_path(@carrier.id), notice:'Transportadora atualizada com sucesso'
    else 
      flash.now[:notice] = 'Não foi possível atualizar a transportadora'
      render 'edit'
    end
  end

  private

  def carrier_params
    params.require(:carrier).permit(:company_name, :company_register,
                                    :brand_name, :city, :state, :adress,
                                    :email_domain, :status)
  end
end
