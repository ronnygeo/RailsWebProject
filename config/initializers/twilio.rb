require 'twilio-ruby'
# put your own credentials here
account_sid = 'ACf2afaa9cdc187bf7eef68ee0fa49d2b3'
auth_token = 'f034694e4ad91d541ebb44900ea8d337'

# set up a client to talk to the Twilio REST API
@twilio_client = Twilio::REST::Client.new account_sid, auth_token
