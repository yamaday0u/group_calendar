FactoryBot.define do
  factory :group do
    name { Faker::Name }
    outline { Faker::Lorem.word }
    task { Faker::Lorem.sentence }
  end
end
