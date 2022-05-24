class PricesController < ApplicationController
  before_action :authenticate_user! 
  def index
    @prices = Price.all.order(km_value: :asc)
  end

  def new
    @carriers = Carrier.all
    @price = Price.new
  end

end
