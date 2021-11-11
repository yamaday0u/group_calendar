FactoryBot.define do
  factory :news do
    title { Faker::Lorem.word }
    content { Faker::Lorem.word }
  end
end
