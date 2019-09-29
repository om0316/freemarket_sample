## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|
|email|string|null: false, unique: true|
|first_name_kanji|string|null: false|
|last_name_kanji|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|birth_day|interger|null: false|
|telephone|interger|
|postal_code|interger|null: false|
|prefectures|string|null: false|
|city|string|null: false|
|address|interger|null: false|
|building|string|
|profic|string|
|icon|string|
|encrypted_password|string|null: false, default: ""|
|reset_password_token|string|unique: true|
|reset_password_sent_at|datetime|
|remember_created_at|datetime|
|created_at|datetime|
|updated_at|datetime|

### Association
- has_many :items
- has_many :buy_items
- has_many :sell_items
- belongs_to :cord

## catagoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|parent_id|interger|

### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|

### Association
- has_many :items


## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true|
|price|interger|null: false|
|detail|text|null: false|
|size|string|null: false|
|condition|string|null: false|
|shipping_burden|interger|null: false|
|shipping_way|string|null: false|
|shipping_place|string|null: false|
|shipping_day|interger|null: false|
|status|interger|null: false|
|catagory_id|references|null: false, foreign_key: true|
|brand_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|

### Association
- has_many :images
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :buy_items
- belongs_to :sell_items

## cordsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## sns_credentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false|
|user_id|references|null: false, foreign_key: true|

### Association
- belongs_to :user

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|references|null: false, foreign_key: true|

### Association
- belongs_to :item

## buy-itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|status|string|null: false|

### Association
- belongs_to :item
- belongs_to :user

## sell-itemsテーブル
|Column|Type|Options|
|------|----|-------|
|item_id|references|null: false, foreign_key: true|
|user_id|references|null: false, foreign_key: true|
|status|string|null: false|

### Association
- belongs_to :item
- belongs_to :user