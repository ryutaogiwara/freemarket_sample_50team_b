# DB設計

## usersテーブル(User情報[親])
|column  |Type    |Option |
|--------|--------|-------|
|id      |integer |null: false|
|nickname|string  |null: false, unique: true|
|email   |string  |null: false|
|password|string  |null: false|
|password_confirmation|string|null: false|
|first_name|string|null: false|
|last_name |string|null: false|
|first_name_kana|string|null: false|
|last_name_kana |string|null: false|
|birth_date|integer|null: false|

### Association
- has_one :profile
- has_one :address
- has_one :card_info
- has_one :user_info
- has_many :items
- has_many :transactions

## profileテーブル(User情報[子])
|column  |Type    |Option |
|--------|--------|-------|
|user_id |integer |null: false, foreign_key: true|
|nickname|string  |null: false|
|profile |text    ||

### Association
- belongs_to :user

## addressテーブル(User情報[子])
|column  |Type    |Option |
|--------|--------|-------|
|zipcode |integer|null: false|
|prefecture|string|null: false|
|city    |string|null: false|
|address |string|null: false|
|building_name|string||
|phone_number|integer||

### Association
- belongs_to :user

##card_info(User情報[子])
|column  |Type    |Option |
|--------|--------|-------|
|number  |integer |null: false|
|month   |integer |null: false|
|day     |integer |null: false|
|security_code|integer|null: false|

### Association
- belongs_to :user

## user_infoテーブル(User情報[子])
|column  |Type    |Option |
|--------|--------|-------|
|zipcode |integer ||
|prefecture|string||
|city    |string  ||
|address |string  ||
|building_name|string||
|user_id |integer |null: false|

### Association
- belongs_to :user

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
|shipping|string  |null: false|
|shipping_data|string|null: false|
|shipping_cost|integer|
|price   |integer |null: false|
|saler_id|references|null: false, foreign_key: true|
|category|string  |null: false|
|size    |string  |null: false|
|brand   |string  ||

### Association
- has_many :transactions
- belongs_to :user

## transactionテーブル
|column  |Type    |Option |
|--------|--------|-------|
|item_id |references|null: false, foreign_key: true|
|user_id |references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
