FactoryGirl.define do
  factory :user do
    sequence(:email) do |n|
      "#{n}@email.com"
    end
    first_name "Test"
    last_name "User"
    password "pass"

    factory :enrolled_user do
      enrollments {[create(:enrollment)]}
    end
  end

end
