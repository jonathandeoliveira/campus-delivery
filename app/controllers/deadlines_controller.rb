class DeadlinesController < ApplicationController
  before_action :autenticate

  def new
    @carrier = Carrier.find(params[:carrier_id])
    @carriers = Carrier.all
    @deadline = Deadline.new
  end

  def create
    @deadline = Deadline.new(deadline_params)
    @deadline.carrier = current_user.carrier
    if @deadline.save!
      redirect_to carrier_path(current_user), notice: 'Prazo de entrega cadastrado com sucesso'
    else
      @carriers = Carrier.anll
      flash.now[:notice] = 'Não foi possível cadastrar o prazo de entrega'
      render 'new'
    end
  end


  private

  def deadline_params
    params.require(:deadline).permit(:km_min,:km_max,:km_time,:carrier_id)
  end
end