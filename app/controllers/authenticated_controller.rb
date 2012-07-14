class AuthenticatedController < ApplicationController
  before_filter :should_be_logged_in

  def should_be_logged_in
    if current_user.nil?
      flash[:notice] = "You need to be logged in to do that."
      redirect_to root_path
    end
  end
end