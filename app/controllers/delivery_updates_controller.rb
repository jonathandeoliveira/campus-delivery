class DeliveryUpdatesController < ApplicationController

  def create
    @order = Order.find(params[:order_id])
    delivery_update_params = params.require(:delivery_update).permit(:coord_position, :delivery_description)
    @delivery_update = DeliveryUpdate.new(delivery_update_params)
    @delivery_update.order = @order 
    if @delivery_update.save
      redirect_to carrier_order_path(@delivery_update.order, @delivery_update) , notice: 'Situação de entrega atualizada com sucesso'
    else 
      redirect_to carrier_order_path(@order.carrier, @order), notice: 'Não foi possível atualizar situação de entrega, preencha todos os campos'
    end
  end

end