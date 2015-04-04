FactoryGirl.define do
  factory :product do
    name Faker::Lorem.words(3).join(" ")
    url Faker::Internet.url
    price_min Random.rand(10)
    price_max Random.rand(10) + 50
    price_retail 12.99
    wine_type Faker::Lorem.words(2).join(" ")
  end
end
