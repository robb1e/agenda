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
        Pick.should_receive(:create).with(place: place, plan_id: plan_id)
        
        planner.add_venue_by_foursquare_id(foursquare_id)
      end
      
    end
    
    context "The venue does exist in the db" do
      it "does something" do
        Plan.stub(:find).with(plan_id) { plan }
        Place.should_receive(:find_by_foursquare_id).with(foursquare_id) { place }
        planner = Agenda::Planner.new(plan_id)
        Pick.should_receive(:create).with(place: place, plan_id: plan_id)
        
        planner.add_venue_by_foursquare_id(foursquare_id)        
      end
    end
  end
  
  describe "#pick" do
    let(:pick_id) { stub }
    let(:plan_id) { stub }
    let(:pick) { stub }
    let(:planner) { Agenda::Planner.new(plan_id) }
    
    it "loads from Pick using the plan id" do
      Pick.should_receive(:find_by_id_and_plan_id).with(pick_id, plan_id) { pick }
      
      planner.pick(pick_id).should == pick
    end
  end
  
  describe "#picked" do
    let(:plan_id) { stub }
    let(:plan) { stub }
    let(:pick_1) { stub("pick1", from: Time.current) }
    let(:pick_2) { stub("pick2", from: 1.hour.ago) }
    let(:pick_3) { stub("pick3", from: 24.hours.ago) }
    let(:picks) { [pick_1, pick_2, pick_3] }
    let(:planner) { Agenda::Planner.new(plan_id) }
    context "all picks have dates" do
      it "groups by date" do
        Plan.should_receive(:find).with(plan_id) { plan }
        plan.should_receive(:picks) { picks }
      
        results = {}
        results[1.day.ago.to_date] = [pick_3]
        results[Date.current.to_date] = [pick_2, pick_1]
        planner.picked.should == results
      end
    end
    
    context "not all picks have dates" do
      let(:pick_4) { stub(from: nil) }
      let(:picks) { [pick_1, pick_2, pick_4, pick_3] }
      it "groups by date" do
        Plan.should_receive(:find).with(plan_id) { plan }
        plan.should_receive(:picks) { picks }
      
        results = {}
        results[1.day.ago.to_date] = [pick_3]
        results[Date.current.to_date] = [pick_2, pick_1]
        planner.picked.should == results
      end      
    end
  end
  
  describe "#is_member?" do
  
    let(:plan_id) { 1 }
    let(:plan) { stub(memberships: memberships) }
    let(:planner) { Agenda::Planner.new(plan_id) }
    let(:user_1) { stub }
    let(:user_2) { stub }
    let(:user_3) { stub }
    let(:member_1) { stub(user: user_1) }
    let(:member_2) { stub(user: user_2) }
    let(:memberships) { [member_1, member_2] }

    before do
      Plan.stub(:find).with(plan_id) { plan }
    end
    
    it "returns true" do
      planner.is_member?(user_1).should == true
    end
    
    it "returns false" do
      planner.is_member?(user_3).should == false
    end
    
  end
  
end