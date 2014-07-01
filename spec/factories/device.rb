FactoryGirl.define do
  factory :device do
    system "Android"
    sequence(:registration_id) { SecureRandom.hex }
  end

  factory :invalid_device, class: Device do
    system ""
    registration_id ""
  end
end
