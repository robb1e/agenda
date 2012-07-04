class Place < ActiveRecord::Base
  attr_accessible :picks, :plans, :foursquare_id, :name
  has_many :picks
  has_many :plans, through: :picks 
end