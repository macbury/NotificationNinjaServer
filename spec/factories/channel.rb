FactoryGirl.define do
  factory :channel do
    account
    sequence(:name) { |s| "Channel#{s}" }
  end

  factory :example_channel, class: Channel do
    sequence(:name) { |s| "Channel#{s}" }
  end
end
