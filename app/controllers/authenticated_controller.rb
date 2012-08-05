class AuthenticatedController < ApplicationController
  
  before_filter :should_be_logged_in

  def should_be_logged_in
    if current_user.nil?
      flash[:notice] = "You need to be logged in to do that."
      render_401
    end
  end

  def is_member
    unless planner.is_member?
      flash[:notice] = "You are not a member"
      render_403
    end
  end
end