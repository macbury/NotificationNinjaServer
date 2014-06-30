json.array!(@channels) do |channel|
  json.extract! channel, :id, :name, :subscription_token, :push_token
  json.url channel_url(channel, format: :json)
  json.subscribe_url api_v1_subscribe_url(token: channel.subscription_token)
  json.push_url api_v1_push_url(token: channel.push_token)
end
