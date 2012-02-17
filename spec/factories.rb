FactoryGirl.define do
  factory :user do
    sequence(:name) {|n| "user#{n}"}
    email {|user| "#{user.name}@example.com".downcase}
    password 'please'
    password_confirmation 'please'

    trait :transmitter do
      role "transmitter"
    end
  end
end

