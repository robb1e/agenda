class SessionsController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_foursquare_id(auth["uid"]) || User.create_from_omniauth(auth)
    access_token = foursquare.access_token(params["code"], sessions_create_url)
    user.foursquare_token = access_token
    user.save!
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Signed out"
  end
end
