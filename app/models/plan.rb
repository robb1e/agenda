class Plan < ActiveRecord::Base
  attr_accessible :name, :from
  has_many :memberships
  has_many :users, through: :memberships
  has_many :picks
  has_many :places, through: :picks
end