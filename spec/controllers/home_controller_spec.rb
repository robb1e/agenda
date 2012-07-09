require 'spec_helper'

describe HomeController do

  describe "#index" do
    let(:user) { stub }
    let(:plans) { stub }
    it "assigs plans" do
      @controller.stub(:current_user) { user }
      user.should_receive(:plans) { plans }
      get :index
      assigns(:plans).should == plans
    end
    
    it "does nothing if no user is present" do
      @controller.stub(:current_user) { nil }
      get :index
      assigns(:plans).should == []
    end
  end

end
