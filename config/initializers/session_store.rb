# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_tech-talk_session',
  :secret      => '6e0509f6cff064c72cdf6f412224fe00361cc9e718ca18c8e8f7161b029bab5177e4007659787524f33f3d1e1721768f53f74b95c8cfdc384244a36a464f18e4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
