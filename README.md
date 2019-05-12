# ruby ver 2.3.1
# rails ver 5.2.3


# DB設計

## usersテーブル(User情報[親])
|column  |Type    |Option |
|--------|--------|-------|
|id      |integer |null: false|
|nickname|string  |null: false, unique: true|
|email   |string  |null: false|
|password|string  |null: false|
|first_name|string|null: false|
|last_name |string|null: false|
|first_name_kana|string|null: false|
|last_name_kana |string|null: false|
|birth_date|integer|null: false|
|profile_id|references|null: false, index: true, foreign_key: true|
|address_id|references|null: false, index: true, foreign_key: true|
|card_info_id|references|null: false, index: true, foreign_key: true|
|user_info_id|references|null: false, index: true, foreign_key: true|

### Association
- has_one :profile, dependent: :destroy
- has_one :address, dependent: :destroy
- has_one :card_info, dependent: :destroy
- has_one :user_info, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :transactions, dependent: :destroy

## profileテーブル(User情報[子])
|column  |Type    |Option |
|--------|--------|-------|
|user_id |references |null: false, foreign_key: true|
|nickname|string  |null: false, unique: true|
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
|user_id |references|null: false, foreign_key: true|

### Association
- belongs_to :user

## card_info(User情報[子])
|column  |Type    |Option |
|--------|--------|-------|
|number  |integer |null: false|
|month   |integer |null: false|
|day     |integer |null: false|
|security_code|integer|null: false|
|user_id |references |null: false, foreign_key|

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
|description|text |null: false|
|state   |string  |null: false|
|postage |string  |null: false|
|region  |string  |null: false|
|shipping|string  |null: false|
|shipping_data|string|null: false|
|price   |integer |null: false|
|category|string  |null: false|
|size    |string  |null: false|
|brand   |string  ||
|saler_id|references|null: false, foreign_key: true|
|transaction_id|ireferences|null: false, foreign_key: true|

### Association
- has_many :transactions, dependent: :destroy
- belongs_to :user

## imagesテーブル
|column  |Type    |Option |
|--------|--------|-------|
|item_id |references |null: false, foreign_key: true|
|image   |string  |null: false|

### Association
- belongs_to :item

## transactionテーブル
|column  |Type    |Option |
|--------|--------|-------|
|item_id |references|null: false, foreign_key: true|
|user_id |references|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
