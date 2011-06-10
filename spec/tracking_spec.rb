require 'spec_helper'

describe "Kontagent::Tracking", "when first created" do
  it "should have invalid configuration (missing)" do
    Kontagent::Tracking.valid?.should == false
  end  
end

