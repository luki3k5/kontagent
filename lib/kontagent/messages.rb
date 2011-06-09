module Kontagent
  # REST API message types as in documentation 
  # http://developers.kontagent.com/getting-started/instrumenting-your-application/kontagent-rest-api

  MESSAGES_TYPES = { :invite_sent                    => "ins", 
                     :invite_response                => "inr",
                     :notification_sent              => "nts",
                     :notification_response          => "ntr",
                     :notification_email_sent        => "nes",
                     :notification_email_response    => "nei",
                     :message_sent                   => "mes",
                     :message_response               => "mer",
                     :stream_post                    => "pst",
                     :stream_post_response           => "psr",
                     :custom_action                  => "evt", 
                     :custom_event                   => "evt", 
                     :application_added              => "apa",
                     :application_installed          => "apa",
                     :application_removed            => "apr",
                     :application_uninstalled        => "apr",    
                     :undirected_communication_click => "ucc",
                     :page_request_and_user_location => "pgr",
                     :user_information               => "cpu",
                     :goal_counts                    => "gci",
                     :revenue_tracking               => "mtu",
                     :unique_tracking_tags           => "" }
end