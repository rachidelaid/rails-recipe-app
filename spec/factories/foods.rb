FactoryBot.define do
  factory :food do
    name { "MyString" }
    measurement_unit { "MyString" }
    price { 1.5 }
    user { nil }
  end
end
