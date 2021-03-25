FactoryBot.define do
  factory :chat do
    text { Faker::Lorem.word }
    association :user
    association :group
  end
end
