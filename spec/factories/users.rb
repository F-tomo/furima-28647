FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {"test@test.com"}
    password              {"aaa111"}
    password_confirmation {password}
    last_name             {"赤井"}
    first_name            {"秀一"}
    last_name_kana        {"アカイ"}
    first_name_kana       {"シュウイチ"}
    birth_date            {"1988-12-2"}
  end
end