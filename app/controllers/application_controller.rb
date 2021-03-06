class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def foursquare
    @foursquare ||= Foursquare::Base.new(ENV['FOURSQUARE_KEY'], ENV['FOURSQUARE_SECRET'])
  end

  def planner
    @plan_id ||= params[:plan_id] || params[:id]
    @planner ||= Agenda::Planner.new(@plan_id, current_user)
  end

  def render_401
    render template: 'errors/401', status: 401
  end

  def render_403
    render template: 'errors/403', status: 403
  end
end
