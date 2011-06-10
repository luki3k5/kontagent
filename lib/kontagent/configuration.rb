class Kontagent::Configuration
  
  TEST_SERVER = "test-server.kontagent.com"
  PROD_SERVER = "api.geo.kontagent.net"
  
  attr_accessor :base_url, :api_key, :secret_key
  
  def initialize
    # by default we initialize TEST_SERVER url
    @base_url = TEST_SERVER
  end
end