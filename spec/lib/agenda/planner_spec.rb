require 'spec_helper'

describe Agenda::Planner do
  
  describe "#initialize" do
    let(:plan_id) { stub }
    let(:plan) { stub }
    it "inits" do
      Plan.should_receive(:find).with(plan_id) { plan }
      planner = Agenda::Planner.new(plan_id)
      planner.plan.should == plan
    end
  end
  
  describe "#add_venue_by_foursquare_id" do
    let(:foursquare_id) { stub }
    let(:plan_id) { stub }
    let(:place) { stub }
    let(:plan) { stub }
    let(:venue) { stub(name: stub) }
    
    context "The venue does not exist in the db" do
      it "creates the venue and returns the new record" do
        Plan.stub(:find).with(plan_id) { plan }
        Place.should_receive(:find_by_foursquare_id).with(foursquare_id) { nil }
        planner = Agenda::Planner.new(plan_id)
        planner.should_receive(:find_venue).with(foursquare_id) { venue }
        Place.should_receive(:create).with(foursquare_id: foursquare_id, name: venue.name) { place }
        Pick.should_receive(:create).with(place: place, plan: plan)
        
        planner.add_venue_by_foursquare_id(foursquare_id)
      end
      
    end
    
    context "The venue does exist in the db" do
      it "does something" do
        Plan.stub(:find).with(plan_id) { plan }
        Place.should_receive(:find_by_foursquare_id).with(foursquare_id) { place }
        planner = Agenda::Planner.new(plan_id)
        Pick.should_receive(:create).with(place: place, plan: plan)
        
        planner.add_venue_by_foursquare_id(foursquare_id)        
      end
    end
  end
end