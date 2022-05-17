FactoryBot.define do
  factory :user do
    name { 'MyString' }
    sequence(:email) { |n| "test#{n}@example.com" }
    confirmed_at { '01-01-01T00:00:00' }
    password { 'password' }
  end
end
