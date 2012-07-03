require 'spec_helper'

describe PlansController do
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
    
    before do
      @controller.should_receive(:current_user) { user }
    end
    
    it "creates a new plan and associates it to the current user" do
      Plan.should_receive(:create) { plan }
      Membership.should_receive(:create).with(plan: plan, user: user)
      
      post :create, parameters
      response.should redirect_to plan_path(plan.id)
    end
  end
end