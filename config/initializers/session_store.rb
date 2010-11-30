# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_social-network_session',
  :secret      => '8c6c479a6e115aa1e0390ca1fb98271417e8f8ad775b3f0e6abcf85b05c51d66422a5df055d78d9f9e312b2abd3a9cabd2b1e8062081994ed5a9bc95f24f5342'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
