require 'spec_helper'

describe PlacesController do

  let(:planner) { stub }
  before do
    @controller.stub(:current_user) { stub }
    @controller.stub(:planner) { planner }
    planner.stub(:is_member?) { true }    
  end

  describe "#create" do
    let(:plan) { stub(id: 1) }
    let(:plan_id) { "1" }
    let(:venue_id) { "venue_id" }
    let(:planner) { stub(plan: plan) }
    
    it "retrieves the venue" do
      planner.should_receive(:add_venue_by_foursquare_id).with(venue_id)
      post :create, plan_id: plan_id, venue_id: venue_id
      response.should redirect_to plan_path(plan)
    end
    
  end

end