require "kontagent"
require 'net/http'

module Kontagent
  module Tracking 
    extend self

    # Check for presence of all necessary data
    # @returns true/false accordingly
    def valid?
      !Kontagent.configuration.base_url.nil? && !Kontagent.configuration.api_key.nil? && !Kontagent.configuration.secret_key.nil? 
    end

    # We only need facebook_user_id two other parameters are optional unless we want to track virality 
    # (unique_tracking_tag = invites, notifications, email or post)
    # (short_tracking_tag = ads, partner sites)
    # More details for usage of the params can be found here:    
    # http://developers.kontagent.com/getting-started/instrumenting-your-application/kontagent-rest-api/application-added
    #
    # @param [String] facebook_user_id      - id of the facebook_user
    # @param [String] unique_tracking_tag
    # @param [String] short_tracking_tag
    # 
    def notify_new_install(facebook_user_id, unique_tracking_tag=nil, short_tracking_tag=nil)    
      path = "/api/v1/#{Kontagent.configuration.api_key}/#{MESSAGES_TYPES[:application_installed]}/?s=#{facebook_user_id}"
      path += "&u=#{unique_tracking_tag}" unless unique_tracking_tag.nil?
      path += "&su=#{short_tracking_tag}" unless short_tracking_tag.nil?    
      call_api(path)
    end

    # We only need facebook_user_id 
    # More details for usage of the params can be found here:    
    # http://developers.kontagent.com/getting-started/instrumenting-your-application/kontagent-rest-api/application-uninstalled
    #
    # @param [String] facebook_user_id      - id of the facebook_user
    #  
    def notify_uninstall(facebook_user_id)
      path = "/api/v1/#{Kontagent.configuration.api_key}/#{MESSAGES_TYPES[:application_uninstalled]}/?s=#{facebook_user_id}"
      call_api(path)
    end

    # This method allows us to track custom events 
    #
    # @see messages.rb for all the possible events or check the kontagent rest api
    # @see http://developers.kontagent.com/getting-started/instrumenting-your-application/kontagent-rest-api/events
    #
    # @param [String]  facebook_user_id     - id of the facebook_user
    # @param [String]  event_name           - name of the event
    # @parma [String]  value                - value of the event
    # @param [String]  level_id             - if of level (ie. for a game)
    # @param [String]  st1                  - subtype 1 
    # @param [String]  st2                  - subtype 2 
    # @param [String]  st3                  - subtype 3
    #
    def notify_custom_event(facebook_user_id, event_name, value, level_id, st1=nil, st2=nil, st3=nil )
      path = "/api/v1/#{Kontagent.configuration.api_key}/#{MESSAGES_TYPES[:custom_event]}/?s=#{facebook_user_id}"
      path += "&n=#{event_name}" unless event_name.nil?
      path += "&v=#{value}"      unless value.nil? 
      path += "&l=#{level_id}"   unless level_id.nil?    

      path += "&s1=#{st1}"   unless st1.nil?    
      path += "&s2=#{st2}"   unless st2.nil?    
      path += "&s3=#{st3}"   unless st3.nil?                
      call_api(path)
    end
    
    private
    def call_api(path)
      http = Net::HTTP.new(Kontagent.configuration.base_url)    
      http.get(path)      
    end
    
  end
end