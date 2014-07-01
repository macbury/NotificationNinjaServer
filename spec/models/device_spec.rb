require 'rails_helper'

RSpec.describe Device, :type => :model do

  it "should generate uid after creation device" do
    device = build(:device)
    expect(device).to receive(:ensure_have_unique_uid).exactly(1).times
    10.times { device.save }
    expect(device.uid).not_to be_empty
  end

end
