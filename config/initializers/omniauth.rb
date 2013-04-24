Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, Constants.auth.twitter.key, Constants.auth.twitter.secret
end
