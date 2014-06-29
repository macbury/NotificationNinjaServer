json.array!(@channels) do |channel|
  json.extract! channel, :id, :name, :subscription_token, :push_token
  json.url channel_url(channel, format: :json)
end
