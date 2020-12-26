FactoryBot.define do
  factory :item do
    association :user
    name          { Faker::String.random }
    discription   { Faker::String.random }
    category_id   { Faker::Number.between(from: 2, to: 11) }
    condition_id  { Faker::Number.between(from: 2, to: 7) }
    postage_id    { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    hold_date_id  { Faker::Number.between(from: 2, to: 4) }
    price         { Faker::Number.between(from: 300, to: 9999999) }

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpg'), filename: 'test_image.jpg')
    end
  end
end
