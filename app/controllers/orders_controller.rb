class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def new
    @carriers = Carrier.all
  end

 
  def create
    @order = Order.new(order_params)
    @order.save
    redirect_to @order , notice: 'Pedido registrado com sucesso'
  end


  def order_params
    params.require(:order).permit(:carrier_id, :vehicle_id, 
      :size,:weight,:customar_name,:customer_adress,:derparture_adress,
      :distance, :track_number, :status, :product_number, :total_price,
      :delivery_deadline)
  end
end
