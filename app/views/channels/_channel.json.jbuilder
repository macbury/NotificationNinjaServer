json.extract! channel, :id, :name, :created_at, :updated_at
json.subscribe_url api_v1_subscribe_url(token: channel.subscription_token)
json.push_url api_v1_push_url(token: channel.push_token)
