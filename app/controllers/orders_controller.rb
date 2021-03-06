class OrdersController < ApplicationController

  def index
    if admin_signed_in?
      @orders = Order.all
    elsif user_signed_in?
      @orders = current_user.carrier.orders
    else
      redirect_to root_path, notice:'Erro! Página não encontrada :('
    end
  end

  def new
    @carriers = Carrier.all
    @order = Order.new
  end

 
  def create
    @carriers = Carrier.all
    @order = Order.new(order_params)
    if @order.save == true
      redirect_to carrier_order_path(@order.carrier, @order) , notice: 'Pedido registrado com sucesso'
    else 
      flash.now[:notice] = 'Não foi possível criar a ordem de serviço'
      render 'new'
    end
  end

  def show
    @delivery_update = DeliveryUpdate.new
    @order = Order.find(params[:id])
    @delivery_updates = @order.delivery_updates
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(accept_order)
      return redirect_to carrier_order_path(@order), notice:'Ordem atualizada com sucesso'
    else
      flash.now[:notice] = 'Não foi possível atualizar a ordem de serviço'
      render 'show'
    end
  end


  def accept
    @order =  Order.find(params[:id])
    if @order.accepted!
    redirect_to carrier_order_path(@order.id), notice: 'Ordem atualizada com sucesso'
    else 
      redirect_to carrier_order_path(@order.id), notice: 'Por favor, selecione um veiculo'
    end
  end
  
  def deny
    @order =  Order.find(params[:id])
    @order.denied!
    redirect_to carrier_order_path(@order.id), notice: 'Ordem atualizada com sucesso'
  end
  
  def in_transit
    @order =  Order.find(params[:id])
    @order.in_transit!
    redirect_to carrier_order_path(@order.id), notice: 'Ordem atualizada com sucesso'
  end
  
  def delivered
    @order =  Order.find(params[:id])
    @order.delivered!
    redirect_to carrier_order_path(@order.id), notice: 'Ordem atualizada com sucesso'
  end

  def search
    @code = params["query"]
    @order = Order.find_by(track_number:@code)
    if @order.present?
      @delivery_update = @order.delivery_updates
    end
  end



private
  def order_params
    params.require(:order).permit(:carrier_id, :vehicle_id, 
      :size,:weight,:customar_name,:customer_adress,:derparture_adress,
      :distance, :track_number, :status, :product_number, :total_price,
      :delivery_deadline)
  end

def accept_order
  params.require(:order).permit(:vehicle_id, :status)
end

#cálculo de volume e preço da entrega
def budget(altura,largura,profundidade,peso,route_km)
  volume = altura * largura * profundidade
  @prices = Price.where('size_min < ? and  size_max > ?', volume,volume )
  final_price = @prices.each do |b|
    b.km_value * route_km
  end
end


end
