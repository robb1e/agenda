require 'spec_helper'

describe Plan do
  describe "associations" do
    it { should have_many(:memberships) }
    it { should have_many(:users).through(:memberships) }
  end
end