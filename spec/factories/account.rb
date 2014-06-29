FactoryGirl.define do
  factory :github, class: Account do
    provider "github"
    uid SecureRandom.hex(6)
    access_token SecureRandom.hex(6)
    sequence :name do |n|
      "github#{n}"
    end
  end
end
