#Figaro.require(["github_client_id", "github_secret"])
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, Figaro.env.github_client_id, Figaro.env.github_secret
end
OmniAuth.config.logger = Rails.logger
