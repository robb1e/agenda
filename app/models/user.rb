class User < ActiveRecord::Base

  attr_accessible :foursquare_id, :first_name, :last_name, :email, :avatar

  has_many :memberships
  has_many :plans, through: :memberships

  def self.create_from_omniauth(auth)
    if "foursquare" == auth["provider"]
      foursquare_id = auth["uid"]
      first_name = auth["info"]["first_name"]
      last_name = auth["info"]["last_name"]
      email = auth["info"]["email"]
      avatar = auth["info"]["image"]
      create!(foursquare_id: foursquare_id, first_name: first_name, last_name: last_name, email: email, avatar: avatar)
    end
  end

end
