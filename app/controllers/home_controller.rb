class HomeController < ApplicationController

def index
  @carrier = Carrier.all
end

end
