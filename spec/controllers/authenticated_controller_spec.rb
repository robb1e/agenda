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
    let(:planner) { stub }
    before do
      @controller.stub(:planner) { planner }
      @controller.stub(:current_user) { user }
      planner.stub(:is_member?) { true }    
    end
    
    it "should redirect to homepage with flash message if no current user" do
      @controller.stub(:current_user) { nil }
      with_auths_routing do      
        get :index
        response.response_code.should == 401
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
  
  describe "#should_be_a_member" do
    let(:planner) { stub }
    let(:user) { stub }
    before do
      @controller.stub(:planner) { planner }
      @controller.stub(:current_user) { user }
      planner.should_receive(:is_member?) { is_member }
    end
    
    context "is a member" do
      let(:is_member) { true }
      it "returns true" do
        with_auths_routing do
          get :index
          response.should be_success
        end
      end
    end
    
    context "is not a member" do
      let(:is_member) { false }
      it "returns false" do
        with_auths_routing do
          get :index
          response.response_code.should == 403
        end
      end
    end
    
  end
  
end