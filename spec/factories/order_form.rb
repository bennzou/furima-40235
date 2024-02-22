FactoryBot.define do
  factory :order_form do
    user_id {Number}
    post_code { "#{Faker::Number.decimal_part(digits: 3)}-#{Faker::Number.decimal_part(digits: 4)}" }
    item_prefecture_id { Faker::Number.between(from: 1, to: 47) }
    city { Faker::Address.city }
    block { Faker::Address.street_address }
    building { Faker::Address.secondary_address }
    phone_number {"09012345678"}
    token { Faker::Internet.password(min_length: 20, max_length: 30) }
  end
end