class Pick < ActiveRecord::Base
  attr_accessible :from, :until, :place, :plan
  belongs_to :place
  belongs_to :plan
end