class PlansController < ApplicationController
  def create
    plan = Plan.create(params[:plan])
    Membership.create(plan: plan, user: current_user)
    redirect_to plan_path(plan)
  end
  
  def show
  end
end