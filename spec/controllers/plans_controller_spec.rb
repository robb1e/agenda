require 'spec_helper'

describe PlansController do
  
  let(:user) { stub }
  let(:planner) { stub }  
  
  before do
    @controller.stub(:current_user) { user }
    @controller.stub(:planner) { planner }
    planner.stub(:is_member?) { true }    
  end
  
  describe "#create" do
    let(:plan_name) { stub }
    let(:from) { stub }
    let(:plan) { stub_model(Plan) }
    let(:user) { stub_model(User) }
    let(:parameters) do
      { plan: {
        from: from,
        name: plan_name
      } }
    end
        
    it "creates a new plan and associates it to the current user" do
      Plan.should_receive(:create) { plan }
      Membership.should_receive(:create).with(plan: plan, user: user)
      
      post :create, parameters
      response.should redirect_to plan_path(plan.id)
    end
  end
  
  describe "#show" do
    let(:plan) { stub_model(Plan) }
    it "sets the plan" do
      Plan.should_receive(:find).with("1") { plan }
      get :show, id: "1"
      assigns(:plan).should == plan
    end
  end
  
  describe "#search" do
    let(:foursquare) { stub }
    let(:venues) { stub }
    let(:places) { stub }
    let(:results) { stub }
    let(:plan) { stub }
    
    it "assigns places" do
      @controller.should_receive(:foursquare) { foursquare }
      foursquare.should_receive(:venues) { venues }
      Plan.should_receive(:find).with("1") { plan }
      venues.should_receive(:search).with(near: "near", query: "query", limit: 5) { results }
      results.should_receive(:[]).with("places") { places }
      get :search, id: "1", near: "near", query: "query"
      assigns(:places).should == places
      assigns(:plan).should == plan
    end
  end
  
end