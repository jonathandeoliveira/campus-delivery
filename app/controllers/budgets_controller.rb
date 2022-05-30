class BudgetsController < ApplicationController

  def index
    @budget = Budget.new
  end

  def create
    @budget = Budget.new(budget_params)
    if @budget.save
      redirect_to @budget
    else
      flash.now[:notice] = 'Não foi possível buscar orçamento'
      render 'index'
    end
  end

  def show
    @search_result = search_result
  end


  private
  def budget_params
    params.require(:budget).permit(:height, :width, :length, :weight, :distance)
  end


  #cálculo de volume e preço da entrega
  def search_result
    @query = Budget.find(params[:id])
    @size = @query.height * @query.width * @query.length
    @weight = @query.weight
    prices = Price.where('size_min < ? and  size_max > ?', @size,@size ).where('weight_min < ? and  weight_max > ?', @weight,@weight )
    carrier_prices = prices.map do |b|
      carrier = b.carrier
      deadline = carrier_deadline(carrier,@query.distance)
      final_price = b.km_value * @query.distance
      {carrier: carrier, final_price: final_price, deadline: deadline}
    end
  end

  def carrier_deadline(carrier,distance)
    carrier.deadlines.where("km_min < #{distance} and km_max > #{distance} ")
  end
    
end
