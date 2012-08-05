class PlansController < AuthenticatedController

  before_filter :is_member, except: [:create]

  def create
    plan = Plan.create(params[:plan])
    Membership.create(plan: plan, user: current_user)
    redirect_to plan_path(plan)
  end

  def show
    @plan = Plan.find(params[:id])
    @planner = Agenda::Planner.new(params[:id], current_user)
  end

  def search
    @plan = Plan.find(params[:id])
    @places = foursquare.venues.search(near: params[:near], query: params[:query], limit: 5)["places"]
  end
end