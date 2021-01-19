FactoryBot.define do
  factory :item_order do
    transient do
      address { Gimei.address }
    end

    token         {"tok_abcdefghijk00000000000000000"}
    post_code     { "123-4567" }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city          { address.city.kanji }
    house_number  { "1-1" }
    building      { "aiueo101" }
    phone         { Faker::Number.leading_zero_number(digits: 11) }
    # item_id       { item.id }
    # user_id       { item.user }
  end
end
