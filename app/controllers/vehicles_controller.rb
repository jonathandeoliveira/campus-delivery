class VehiclesController < ApplicationController
  before_action :authenticate_user!
  def index
    @carrier = current_user.carrier
    @vehicles = current_user.carrier.vehicles
  end

  def new
    @carriers = Carrier.all
    @vehicle = Vehicle.new
  end

  def create
    @vehicle= Vehicle.new(vehicle_params)
    @vehicle.carrier = current_user.carrier
    if @vehicle.save
      redirect_to carrier_vehicles_path(current_user), notice: 'Veículo cadastrado com sucesso'
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
    params.require(:vehicle).permit(:lincese_plate, :brand, :model, :year, :weight_capacity)
  end
end