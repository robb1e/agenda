class PicksController < ApplicationController
  
  def show
    planner = Agenda::Planner.new(params[:plan_id])
    @pick = planner.pick(params[:id])
  end
  
  def update
    planner = Agenda::Planner.new(params[:plan_id])
    pick = planner.pick(params[:id])
    pick.update_attributes(params[:pick])
    redirect_to plan_path(planner.plan_id)
  end
  
end