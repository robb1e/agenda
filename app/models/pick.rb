class Pick < ActiveRecord::Base
  attr_accessible :from, :until, :place, :plan, :plan_id
  belongs_to :place
  belongs_to :plan
  
  delegate :name, to: :place
end