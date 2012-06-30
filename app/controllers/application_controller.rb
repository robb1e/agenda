class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  
  private
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def foursquare
    unless current_user
      @foursquare ||= Foursquare::Base.new(ENV['FOURSQUARE_KEY'], ENV['FOURSQUARE_SECRET'])
    else
      @foursquare ||= Foursquare::Base.new(session[:access_token])
    end
  end  
  
end
