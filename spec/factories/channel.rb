FactoryGirl.define do
  factory :channel do
    account
    sequence(:name) { |s| "Channel#{s}" }
  end
end
