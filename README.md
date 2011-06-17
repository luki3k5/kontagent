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

If we want to notify API about new installation:
<pre>
<code>Kontagent::Tracking.notify_new_install(facebook_id)</code>
</pre>

in the same manner we can quickly notify application removal
<pre>
<code>Kontagent::Tracking.notify_uninstall(facebook_id)</code>
</pre>

On top of these two predefined events we can a call custom one:
<pre>
<code>Kontagent::Tracking.notify_custom_event(facebook_user_id, event_name, value, level_id, st1=nil, st2=nil, st3=nil)</code>
</pre> 

	
Notice how it takes different arguments, their meanings are:

* facebook_user_id     - id of the facebook_user
* event_name           - name of the event
* value                - value of the event
* level_id             - if of level (ie. for a game)
* st1                  - subtype 1 
* st2                  - subtype 2 
* st3                  - subtype 3
	


Here is the list of possible messages types for custom event_names the mappings are available in <pre>./lib/kontagent/messages.rb</pre> file
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


Credits
--

Initially luki3k5 (Lukasz Lazewski) started this as an answer to lack of proper standalone Kontagent library in ruby.  

