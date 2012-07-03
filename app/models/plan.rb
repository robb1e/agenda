class Plan < ActiveRecord::Base
  attr_accessible :name, :from
  has_many :memberships
  has_many :users, through: :memberships
end