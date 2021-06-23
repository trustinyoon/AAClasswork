FactoryBot.define do
  factory :user do
    username { Faker::Games::Overwatch.hero }
    password { "123456" }
  end
end
