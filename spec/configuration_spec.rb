require 'spec_helper'

describe "Kontagent.configuration", "when first created" do
  
  it "should has base_url set to test server" do
    Kontagent.configuration.base_url = "test-server.kontagent.com"
  end

  it "should has no api_key set yet" do
    Kontagent.configuration.api_key.should == nil
  end

  it "should has no secret_key set yet" do
    Kontagent.configuration.secret_key.should == nil
  end

  it "we should be able to set api_key and check it's presence" do
    Kontagent.configuration.api_key = "api_key_1234"
    Kontagent.configuration.api_key.should == "api_key_1234"
  end

  it "we should be able to set secret_key and check it's presence" do
    Kontagent.configuration.secret_key = "secret_key_1234"
    Kontagent.configuration.secret_key.should == "secret_key_1234"
  end
  
end