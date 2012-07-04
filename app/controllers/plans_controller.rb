class PlansController < ApplicationController
  def create
    plan = Plan.create(params[:plan])
    Membership.create(plan: plan, user: current_user)
    redirect_to plan_path(plan)
  end
  
  def show
    @plan = Plan.find(params[:id])
  end
  
  def search
    @places = foursquare.venues.search(near: params[:near], query: params[:query], limit: 5)["places"]
  end
  
end