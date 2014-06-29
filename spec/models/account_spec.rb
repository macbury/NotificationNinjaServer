require 'rails_helper'

RSpec.describe Account, :type => :model do
  it "should generate unique token and save it" do
    user = create(:github)
    expect(user.generate_session_token!).not_to be_empty
    expect(user.session_key).not_to be_nil
    expect(user.generate_session_token!).not_to eq(user.generate_session_token!)
  end
end
