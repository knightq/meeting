# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_meeting_session',
  :secret      => '9aaccbfaa37c6e007b789947d4402a20f17a75c1c91e4513e79bb7f2520ad5f87fb9ef8508b4cae6d90c5cf3f542e15d5d3dc37c270dfd2aa80c74fcaa46affc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
ActionController::Base.session_store = :active_record_store
