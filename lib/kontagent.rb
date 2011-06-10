module Kontagent
  
  # @return [Configuration] The configuration singleton.
  def self.configuration
    @configuration ||= Kontagent::Configuration.new
  end  
    
end

require "kontagent/version"
require "kontagent/messages"
require "kontagent/configuration"
require "kontagent/tracking"
