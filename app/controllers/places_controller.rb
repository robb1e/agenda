class PlacesController < AuthenticatedController
  def create
    planner.add_venue_by_foursquare_id(params[:venue_id])
    redirect_to plan_path(planner.plan)
  end
end