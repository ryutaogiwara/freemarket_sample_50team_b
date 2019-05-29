crumb :root do
  link "メルカリ", root_path
end

# マイページ
crumb :user_show do
  link "マイページ", user_path(current_user.id)
  parent :root
end

# 支払い方法ページ
crumb :card_info_show do
  link "支払い方法", user_card_infos_path
  parent :user_show
end

# クレジットカード情報入力ページ
crumb :card_info_new do
  link "クレジットカード情報入力"
  parent :card_info_show
end

# 商品詳細ページ
crumb :item_show do |item|
  link item.name, item
  parent :root
end

# If you want to split your breadcrumbs configuration over multiple files, you
# can create a folder named `config/breadcrumbs` and put your configuration
# files there. All *.rb files (e.g. `frontend.rb` or `products.rb`) in that
# folder are loaded and reloaded automatically when you change them, just like
# this file (`config/breadcrumbs.rb`).
