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
|provider |string||
|uid |string||
|birth_date|date|null: false|
|profile|references|null: false, index: true, foreign_key: true|
|address|references|null: false, index: true, foreign_key: true|
|card_info|references|null: false, index: true, foreign_key: true|
|user_info|references|null: false, index: true, foreign_key: true|

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
|user |references |null: false, foreign_key: true|
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
|user |references|null: false, foreign_key: true|

### Association
- belongs_to :user

## card_info(User情報[子])
|column  |Type    |Option |
|--------|--------|-------|
|user |references |null: false, foreign_key|
|customer_id|string||
|card_id|string||

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
|user |references |null: false, foreign_key: true|

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
|category|references  |foreign_key: true|
|size    |string  |null: false|
|brand   |string  ||
|buyer|reference||
|user|references|null: false, foreign_key: true|

### Association
- has_one :transactions, dependent: :destroy
- has_many :images, dependent: :destroy
- belongs_to :user

## imagesテーブル
|column  |Type    |Option |
|--------|--------|-------|
|item |references |null: false, foreign_key: true|
|image   |string  |null: false|

### Association
- belongs_to :item

## categoryテーブル
|column  |Type    |Option |
|--------|--------|-------|
|name|string|null: false|
|parent |references|foreign_key: true|
|grandparent |references|foreign_key: true|

### Association
- has_many :items
### 自己結合
- has_many :children, class_name: "Category", foreign_key: "parent_id"
- belongs_to :parent, class_name: "Category", foreign_key: "parent_id"
- has_many :grandchildren, class_name: "Category", foreign_key: "grandparent_id"
- belonds_to :grandparent, class_name: "Category", foreign_key: "grandparent_id"
