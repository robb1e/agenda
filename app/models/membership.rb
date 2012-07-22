class Membership < ActiveRecord::Base
  attr_accessible :user, :plan
  belongs_to :user
  belongs_to :plan

  def name
    user.name
  end
end