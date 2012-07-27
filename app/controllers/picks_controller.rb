class PicksController < AuthenticatedController

  def show
    @pick = planner.pick(params[:id])
  end

  def update
    pick = planner.pick(params[:id])
    pick.update_attributes(params[:pick])
    redirect_to plan_path(planner.plan_id)
  end
end