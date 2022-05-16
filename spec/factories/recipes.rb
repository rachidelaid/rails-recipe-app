FactoryBot.define do
  factory :recipe do
    name { "MyString" }
    preparation_time { "MyString" }
    cooking_time { "MyString" }
    decription { "MyString" }
    public { false }
    user { nil }
  end
end
