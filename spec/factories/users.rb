FactoryGirl.define do
  factory :user do
    email "test@test.com"
    first_name "Test"
    last_name "User"
    password "pass"
  end
end
