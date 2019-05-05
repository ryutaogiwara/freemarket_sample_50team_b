# DB設計

## usersテーブル
|column  |Type    |Option |
|--------|--------|-------|
|id      |integer |null: false|
|nickname|string  |null: false, unique: true|
|email   |string  |null: false|
|password|string  |null: false|
|password_confirmation|string|null: false|

### Association
- has_many :item_users
- has_many :items, through: :item_users


## itemsテーブル
|column  |Type    |Option |
|--------|--------|-------|
|id      |integer |null: false|
|name    |string  |null: false|
|image   |string  |null: false|
|description|text |null: false|
|state   |string  |null: false|
|postage |string  |null: false|
|region  |string  |null: false|
|shipping_data|string|null: false|
|price   |integer |null: false|
|saler_id|references|null: false, foreign_key: true|
|category|string  |null: false|
|brand   |string  |
|shipping_cost|integer|
|shipping|string  |null: false|

### Association
- has_many :item_users
- has_many :users, through: :item_users

## item_usersテーブル
|column  |Type    |Option |
|--------|--------|-------|
|item_id |references|null: false, foreign_key: true|
|buyer_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
