class PricesController < ApplicationController

  def index
    @prices = Price.all.order(km_value: :asc)
  end

  def new
    @price = Price.new
  end

end
