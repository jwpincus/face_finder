FactoryGirl.define do
  factory :app do
    name "NewApp"
    min_confidence 60
    sequence(:app_key) {|n| SecureRandom.hex(10)}

  end
end
