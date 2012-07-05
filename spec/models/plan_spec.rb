require 'spec_helper'

describe Plan do
  describe "associations" do
    it { should have_many(:memberships) }
    it { should have_many(:users).through(:memberships) }
    it { should have_many(:picks) }
    it { should have_many(:places).through(:picks) }
  end
end