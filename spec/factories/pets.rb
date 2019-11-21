FactoryBot.define do
  factory :pet do
    name { Faker::Creature::Dog.name }
    birthdate { Faker::Date.birthday(max_age: 18) }
    breed { Faker::Creature::Dog.breed }
    kind { nil }
  end
end
