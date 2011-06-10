Library for Kontagent REST API
===========

About
--
This is a library for kontagent ([http://kontagent.com](http://kontagent.com)) analytics package for Facebook.
It is implemented as a standalone library without any dependencies. 
There is no need to have it on top of Facebooker plugin - works great with Sinatra, Padrino and Rails apps. 

It can:

* Register new installs/uninstalls 
* Register any custom event as described in documentation from Kontagent.
* Supports custom subsets (up to three) and all the values from standard REST API by Kontagent 

Please check the 'Usage' section to see all the possible codes. 
 
Install
-- 
  Clone this repository 
 <pre><code>$ git clone http://github.com/luki3k5/kontagent</code></pre>
  or install with the gem
 <pre><code>$ gem install kontagent</code></pre>

Setup
--
  You need to pass your api key and secret to the Kontagent::Tracking.configure: 
   <pre>
<code>Kontagent::Tracking.configure[:api_key] = "..."
Kontagent::Tracking.configure[:secret] = "..."</code></pre>

By default Library sends all the notifications to the Kontagent's test server (test-server.kontagent.com) you have to configure it otherwise if you wish to hit your production setup
   <pre><code>Kontagent::Tracking.configure[:base_url] = "..."</code></pre>
Usage
--

Here is the list of possible messages types the mappings are available in <pre>./lib/kontagent/messages.rb</pre> file
and are corresponding to the  [kontagent REST API documentation](http://developers.kontagent.com/getting-started/instrumenting-your-application/kontagent-rest-api)

<pre>
:invite_sent                    => "ins",
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
</pre>


License
-- 

Credits
--


