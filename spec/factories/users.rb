FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    identity { Faker::Job.position }
  end
end
