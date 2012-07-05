class PlacesController < ApplicationController 
  def create
    planner = Agenda::Planner.new(params[:plan_id])
    planner.add_venue_by_foursquare_id(params[:venue_id])
    redirect_to plan_path(planner.plan)
  end
end