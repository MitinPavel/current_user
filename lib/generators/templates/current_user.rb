::CurrentUser.setup do |config|

  # If you want to have a custom authentication key, it might look like:
  # config.authentication_key = '4242424242424242'
  config.authentication_key = ::CurrentUser.read_authentication_key

  # Setup how users might be distinguished via UI.
  # It might be a symbol, a string or a lambda.
  # For the last case it might be:
  # config.identifier = lambda { |u| "User with email #{u.email}" }
  config.identifier = :email
end