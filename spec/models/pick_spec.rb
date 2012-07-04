require 'spec_helper'

describe Pick do
  
  describe "associations" do
    it { should belong_to(:plan) }
    it { should belong_to(:place) }
  end
  
end