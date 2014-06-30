require 'rails_helper'

RSpec.describe Channel, :type => :model do
  it "should generate tokens after create" do
    channel = create(:channel)
    expect(channel.push_token).not_to be_nil
    expect(channel.subscription_token).not_to be_nil
  end
end
