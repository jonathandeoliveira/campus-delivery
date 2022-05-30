class BudgetsController < ApplicationController

  def index
    @budget_history = Budget.all
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
    if search_result.present?
    @search_result = search_result
    @query.query_result = @search_result
    else
    @query.query_result = ['Não foi encontrado nenhum orçamento para estes dados']
    end
  end


  private
  def budget_params
    params.require(:budget).permit(:height, :width, :length, :weight, :distance)
  end


  #cálculo de volume e preço da entrega
  def search_result
    @query = Budget.find(params[:id])
    size = @query.volum_calculator
    weight = @query.weight
    distance = @query.distance
    prices = Price.search(size,weight)
    carrier_prices = prices.map do |b|
      carrier = b.carrier
      deadline = carrier.carrier_deadlines(distance)
      final_price = b.km_value * @query.distance
      {carrier: carrier, final_price: final_price, deadline: deadline}
    end
  end


end
