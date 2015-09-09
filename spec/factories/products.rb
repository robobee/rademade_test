FactoryGirl.define do

  factory :product do
    name { Faker::Commerce.product_name }
    description { Faker::Lorem.sentence }
    alias_name { Faker::Lorem.word }
    price { Faker::Commerce.price }
  end

end
