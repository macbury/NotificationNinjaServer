FactoryGirl.define do

  factory :github_auth_hash, class: OmniAuth::AuthHash do
    provider :github
    sequence(:uid) { |s| "0000#{s}" }
    sequence(:info) { |s|
      {
        "name"     => "name#{s}",
        "nickname" => "nickname#{s}",
        "email"    => "email#{s}@test.local"
      }
    }
  end
end
