FactoryBot.define do
  factory :calendar do
    title { Faker::Lorem.word }
    content { Faker::Lorem.word }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    association :user
  end
end
