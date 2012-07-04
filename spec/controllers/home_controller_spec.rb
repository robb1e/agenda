require 'spec_helper'

describe HomeController do

  describe "#index" do
    let(:user) { stub }
    let(:plans) { stub }
    it "assigs plans" do
      @controller.should_receive(:current_user) { user }
      user.should_receive(:plans) { plans }
      get :index
      assigns(:plans).should == plans
    end
  end

end
