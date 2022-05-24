class DeadlinesController < ApplicationController
  before_action :authenticate_user!  
  def new
    @carrier = current_user.carrier
    @carriers = Carrier.all
    @deadline = Deadline.new
  end

  def create
  end
end