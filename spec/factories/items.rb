FactoryBot.define do
  factory :item do
    name              {Faker::Name.name}
    description       {"説明内容"}
    state             {"neko状態"}
    postage           {"着払い"}
    region            {"neko"}
    shipping          {"クロネコ"}
    shipping_date     {"999日"}
    price             {Faker::Number.number(5)}
    category          {"neko"}
    size              {"5L"}
    brand             {"neko"}
    user_id           {1}
    created_at        {"2019-05-18 09:46:46"}
    updated_at        {"2019-05-18 09:46:46"}
  end

end
