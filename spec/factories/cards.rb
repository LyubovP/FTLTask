FactoryBot.define do
  factory :card do
    association :user, factory: :user
    
    title             { Faker::Lorem.characters(number: (rand 3..128)) }
    description       { Faker::Lorem.sentence(word_count: 10) }
    category          { [:Trip, :Event, :House, :Shoping].sample }
    currency          { [:UAH, :USD].sample }
  end
end