class Invitation < ActiveRecord::Base
    attr_accessible :plan, :user, :invite_code
    belongs_to :plan
    belongs_to :user
end