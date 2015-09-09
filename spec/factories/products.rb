FactoryGirl.define do

  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    sequence(:alias_name) { |n| "alias-#{n}" }
    price { Faker::Commerce.price }
  end

end
