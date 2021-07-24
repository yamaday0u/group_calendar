FactoryBot.define do
  factory :group_calendar_chat do
    text { Faker::Lorem.word }
    association :user
    association :calendar_for_group
  end
end
