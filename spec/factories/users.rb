FactoryGirl.define do
  factory :user do
    name "Example"
    email "example@example.com"
    password "foobarbar"
    password_confirmation "foobarbar"

    trait :admin do
      admin true
    end
  end
end
