require 'spec_helper'

describe User do

  describe "associations" do
    it { should have_many(:memberships) }
    it { should have_many(:plans).through(:memberships) }
  end

  describe ".create_from_omniauth" do
    let(:foursquare_id) { stub }
    let(:first_name) { stub }
    let(:last_name) { stub }
    let(:email) { stub }
    let(:avatar) { stub }
    let(:auth) do
      auth = {}
      auth["uid"] = foursquare_id
      auth["provider"] = "foursquare"
      auth["info"] = {}
      auth["info"]["first_name"] = first_name
      auth["info"]["last_name"] = last_name
      auth["info"]["email"] = email
      auth["info"]["image"] = avatar
      auth
    end
    
    it "creates a new user" do
      User.should_receive(:create!).with(foursquare_id: foursquare_id, first_name: first_name, last_name: last_name, email: email, avatar: avatar)
      User.create_from_omniauth(auth)
    end
    
  end
  
  describe ".create_with_facebook_omniauth" do
    let(:auth) do
      {
        :provider => 'facebook',
        :uid => '1234567',
        :info => {
          :nickname => 'jbloggs',
          :email => 'joe@bloggs.com',
          :name => 'Joe Bloggs',
          :first_name => 'Joe',
          :last_name => 'Bloggs',
          :image => 'http://graph.facebook.com/1234567/picture?type=square',
          :urls => { :Facebook => 'http://www.facebook.com/jbloggs' },
          :location => 'Palo Alto, California',
          :verified => true
        }
      }
    end
    
    it "creates a new user" do
      User.should_receive(:create!).with(facebook_id: auth[:uid], first_name: auth[:info][:first_name], last_name: auth[:info][:last_name], email: auth[:info][:email], avatar: auth[:info][:image])
      User.create_with_facebook_omniauth(auth)
    end
    
  end

end
