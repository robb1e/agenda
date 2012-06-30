require 'spec_helper'

describe User do

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

end
