FactoryBot.define do
  factory :calendar_for_group do
    title { Faker::Lorem.word }
    content { Faker::Lorem.word }
    start_time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    end_time { start_time + 3600 } # Set end_time 1 hour later than start_time
    association :user
    association :group
  end
end
