class CarriersController < ApplicationController

  def new
    @carrier = Carrier.new
  end

  def show
    @carrier = Carrier.find(params[:id])
  end

  def create
    @carrier = Carrier.new(carrier_params)
    if @carrier.save
      redirect_to root_path, notice: 'Transportadora cadastrada com sucesso!'
    else
      flash.now[:notice] = 'Erro! Não foi possível cadastrar uma nova transportadora'
      render 'new' 
    end
  end

  private

  def carrier_params
    params.require(:carrier).permit(:company_name, :company_register,
                                    :brand_name, :city, :state, :adress,
                                    :email_domain, :status)
  end
end
