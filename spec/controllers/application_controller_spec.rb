require 'spec_helper'

describe ApplicationController do

  describe "#current_user" do
    let(:user) { stub }
    let(:user_id) { stub }

    subject { @controller }

    context "the user id is set" do
      before do
        session[:user_id] = user_id
        User.should_receive(:find).with(user_id) { user }
      end
      
      its(:current_user) { should == user }
    end
    
    context "the user id is not set" do
      its(:current_user) { should == nil }
    end
  end

end
