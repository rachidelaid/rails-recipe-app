FactoryBot.define do
  factory :recipe do
    name { 'apple' }
    preparation_time { '10 hours' }
    cooking_time { '1 hour' }
    decription { 'apple' }
    public { false }
    user
  end
end
