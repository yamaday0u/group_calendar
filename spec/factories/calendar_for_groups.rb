FactoryBot.define do
  factory :calendar_for_group do
    title { Faker::Lorem.word }
    content { Faker::Lorem.word }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    association :user
    association :group
  end
end
