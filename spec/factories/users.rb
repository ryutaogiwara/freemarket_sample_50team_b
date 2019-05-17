FactoryBot.define do
  factory :user do
    id                    {"1"}
    nickname              {"aaa"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    email                 {"kkk@gmail.com"}
    first_name            {"直樹"}
    last_name             {"山田"}
    first_name_kana       {"ナオキ"}
    last_name_kana        {"ヤマダ"}
    birth_date            {"2017"}
    profile_id            {"1"}
    card_info_id          {"1"}
    user_info_id          {"1"}
  end
end
