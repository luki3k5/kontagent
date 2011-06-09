require "kontagent/version"
require "kontagent/messages"

require 'net/http'
require 'cgi'
require 'socket'

module Kontagent
  class Tracking

    attr_accessor :base_url, :api_key, :secret_key


    def initialize(base_url, api_key, secret_key)
      @base_url   = base_url
      @api_key    = api_key
      @secret_key = secret_key 
    end

    # We only need facebook_user_id two other parameters are optional unless we want to track virality 
    # (unique_tracking_tag = invites, notifications, email or post)
    # (short_tracking_tag = ads, partner sites)
    # More details for usage of the params can be found here:    
    # http://developers.kontagent.com/getting-started/instrumenting-your-application/kontagent-rest-api/application-added
    # 
    def notify_new_install(facebook_user_id, unique_tracking_tag=nil, short_tracking_tag=nil)
      path = "/api/v1/#{@api_key}/#{MESSAGES_TYPES[:application_installed]}/?s=#{facebook_user_id}"
      path += "&u=#{unique_tracking_tag}" unless unique_tracking_tag.nil?
      path += "&su=#{short_tracking_tag}" unless short_tracking_tag.nil?    

      http = Net::HTTP.new("#{@base_url}")    
      http.get(path)

    end

    # We only need facebook_user_id 
    # More details for usage of the params can be found here:    
    # http://developers.kontagent.com/getting-started/instrumenting-your-application/kontagent-rest-api/application-uninstalled
    #  
    def notify_uninstall(facebook_user_id)
      path = "/api/v1/#{@api_key}/#{MESSAGES_TYPES[:application_uninstalled]}/?s=#{facebook_user_id}"

      http = Net::HTTP.new("#{@base_url}")    
      http.get(path)
    end

    # This method allows us to track custom events 
    #
    # http://developers.kontagent.com/getting-started/instrumenting-your-application/kontagent-rest-api/events
    #
    def notify_custom_event(facebook_user_id, event_name, value, level_id, st1=nil, st2=nil, st3=nil )
      path = "/api/v1/#{@api_key}/#{MESSAGES_TYPES[:custom_event]}/?s=#{facebook_user_id}"
      path += "&n=#{event_name}" unless event_name.nil?
      path += "&v=#{value}"      unless value.nil? 
      path += "&l=#{level_id}"   unless level_id.nil?    

      path += "&s1=#{st1}"   unless st1.nil?    
      path += "&s2=#{st2}"   unless st2.nil?    
      path += "&s3=#{st3}"   unless st3.nil?                

      http = Net::HTTP.new("#{@base_url}")    
      http.get(path)
    end

  end

end
