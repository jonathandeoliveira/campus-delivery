class VehiclesController < ApplicationController
  def index
    @carrier = Carrier.find(params[:carrier_id])
    @vehicles = @carrier.vehicles
  end

  def new
    @carriers = Carrier.all
    @vehicle = Vehicle.new
  end

  def create
    @vehicles = Vehicle.all
    @vehicle= Vehicle.new(vehicle_params)
    if @vehicle.save
      redirect_to @vehicle, notice: 'Veículo cadastrado com sucesso'
    else
      @carriers = Carrier.all
      flash.now[:notice] = 'Não foi possível cadastrar o veículo'
      render 'new'
    end
  end

  def show
    @carrier = Carrier.find(params[:id])
    @vehicle = Vehicle.find(params[:id])
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:lincese_plate, :brand, :model, :year, :weight_capacity, :carrier_id)
  end
end