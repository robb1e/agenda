require 'spec_helper'

describe SessionsController do
  context "Foursquare" do
    describe "#create" do
      let(:foursquare_id) { stub }
      let(:foursquare_client) { stub }

      let(:env) do
        env = {}
        env["omniauth.auth"] = {}
        env["omniauth.auth"]["uid"] = foursquare_id
        env["omniauth.auth"]["provider"] = 'foursquare'
        env
      end
      let(:token) { stub('token') }
      let(:code) { stub }
     
      before do
        request.stub(:env) { env }
        User.should_receive(:find_by_foursquare_id).with(foursquare_id) { user }
        @controller.should_receive(:foursquare) { foursquare_client }
        foursquare_client.should_receive(:access_token) { token }
      end
    
      context "user already exists" do
        let(:user) { stub(id: stub) }
        before do 
          user.should_receive(:foursquare_token=).with(token)
          user.should_receive(:save!)
        end
      
        it "sets the current user" do
          get :create, { provider: 'foursquare', code: token }
          response.should redirect_to(root_path)
          session[:user_id].should == user.id
        end
      end
    
      context "user does not exist" do
        let(:user) { nil }
        let(:new_user) { stub(id: stub) }
        before do
          User.should_receive(:create_from_omniauth) { new_user }
          new_user.should_receive(:foursquare_token=).with(token)
          new_user.should_receive(:save!)
        end
      
        it "creates a new user" do
          get :create, { provider: 'foursquare', code: token }
          response.should redirect_to(root_path)
          session[:user_id].should == new_user.id
        end
      end
    end
  end
  
  context "Facebook" do
    describe "#create" do
      let(:facebook_uid) { stub }
      let(:user) { stub(id: stub) }
      let(:env) do
        env = {}
        env["omniauth.auth"] = {}
        env["omniauth.auth"]["provider"] = 'facebook'
        env["omniauth.auth"]["uid"] = facebook_uid
        env
      end
      
      before do
        request.stub(:env) { env }
      end
      
      context "user already exist" do
        before do
          User.should_receive(:find_by_facebook_id).with(facebook_uid) { user }
        end
        it "sets the current user" do
          get :create, { provider: 'facebook' }
          session[:user_id].should == user.id
        end
      end
      
      context "user does not exist" do
        before do
          User.should_receive(:find_by_facebook_id).with(facebook_uid) { nil }
          User.should_receive(:create_with_facebook_omniauth).with(env["omniauth.auth"]) { user }
        end
        it "sets the current user" do
          get :create, { provider: 'facebook' }
          session[:user_id].should == user.id
          response.should redirect_to(root_path)
        end        
      end
    end
  end
  
  describe "#destroy" do
    it "removes the current user" do
      get :destroy
      response.should redirect_to(root_path)
      session[:user_id].should == nil
    end
  end

end
