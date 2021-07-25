FactoryBot.define do
  factory :mate_chat do
    text { Faker::Lorem.word }
    association :user
    association :room
  end
end
