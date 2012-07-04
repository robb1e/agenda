class HomeController < ApplicationController
  
  def index
    @plans = current_user.plans
  end
  
end
