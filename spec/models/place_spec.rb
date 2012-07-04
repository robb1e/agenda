require 'spec_helper'

describe Place do
  
  describe "associations" do
    it { should have_many(:picks) }
    it { should have_many(:plans).through(:picks) }
  end
  
end