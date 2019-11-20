FactoryBot.define do
  factory :pet do
    name { "MyString" }
    birthdate { "2019-11-20" }
    breed { "MyString" }
    kind { nil }
  end
end
