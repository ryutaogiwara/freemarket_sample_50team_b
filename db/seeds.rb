# 10.times do |n|
#   nickname = Faker::JapaneseMedia::DragonBall.character
#   email = Faker::Internet.email
#   gimei = Gimei.new
#   birth_date = Faker::Time.between(40.years.ago, 18.years.ago, :all).to_s[0, 10]
#   profile_id = "#{n+1}"
#   address_id = "#{n+1}"
#   card_info_id = "#{n+1}"
#   user_info_id = "#{n+1}"
#   User.create!(nickname: nickname,
#                email: email,
#                password: "password",
#                password_confirmation: "password",
#                first_name: gimei.first.kanji,
#                last_name: gimei.last.kanji,
#                first_name_kana: gimei.first.katakana,
#                last_name_kana: gimei.last.katakana,
#                birth_date: birth_date,
#                profile_id: profile_id,
#                address_id: address_id,
#                card_info_id: card_info_id,
#                user_info_id: user_info_id)
# end

require "csv"

CSV.foreach('db/category.csv') do |row|
  Category.create(:name => row[0], parent_id: row[1], grandparent_id: row[2])
end
