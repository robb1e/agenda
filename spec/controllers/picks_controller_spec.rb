require 'spec_helper'

describe PicksController do
  
  describe "#show" do
    let(:pick_id) { "1" }
    let(:plan_id) { "1" }
    let(:pick) { stub }
    let(:planner) { stub }
    
    it "assigns the pick" do
      Agenda::Planner.should_receive(:new).with(plan_id) { planner }
      planner.should_receive(:pick).with(pick_id) { pick }
      
      get :show, id: pick_id, plan_id: plan_id
      assigns(:pick).should == pick
    end
  end
  
end