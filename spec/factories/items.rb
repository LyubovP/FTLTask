FactoryBot.define do
  factory :item do
    association :user, factory: :user
    association :card, factory: :card
    
    title              { Faker::Lorem.characters(number: (rand 3..128)) }
    price              {Faker::Number.between(1,500).to_s}
    category           { [:Traveling, :Clothing, :Taxi, :Cafes, :Shops, :Other].sample }
  end
end