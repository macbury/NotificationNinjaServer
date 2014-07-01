if @channel.valid?
  json.extract! @channel, :uid, :system, :registration_id, :created_at, :updated_at
else
  json.errors @channel.errors
end
