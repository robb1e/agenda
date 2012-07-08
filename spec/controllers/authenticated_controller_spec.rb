require 'spec_helper'

class AuthsController < AuthenticatedController
  def index
    render :text => "foo"
  end
end

describe AuthsController do
  
  def with_auths_routing
    with_routing do |map|
      map.draw do
        resources :auths, :only => [:index]
        root to: 'home#index'
      end
      yield
    end
  end
  
  describe "#should_be_logged_in" do
    it "should redirect to homepage with flash message if no current user" do
      @controller.stub(:current_user) { nil }
      with_auths_routing do      
        get :index
        response.should redirect_to root_path
        flash[:notice].should == "You need to be logged in to do that."
      end
    end
    
    it "should continue" do
      @controller.stub(:current_user) { stub }
      with_auths_routing do
        get :index
        response.should be_success
      end
    end
  end
  
end