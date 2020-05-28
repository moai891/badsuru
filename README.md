# Name badsuru(バドする)
バドするは、バドミントン練習会の運営をサポートします。

# DEMO

# 特徴
- グループ作成機能
- 練習予定投稿機能
- 練習参加者管理機能
- メッセージ投稿機能
- 参加者承認機能

## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string| null: false|
|phonenumber|string| unique: true|
|old|integer| null: false|
|job|integer| null: false|
|email|string|null: false, default: ""|
|detail|text|
|avatar|string|

### Association
- has_many :items, dependent: :destroy
- has_one :card dependent: :destroy
- has_one :address dependent: :destroy

## addressesテーブル

|Column|Type|Options|
|------|----|-------|
|user|reference|null: false, foreign_key: true|
|postal_code|string|null: false|
|prefecture_code|integer|null: false|
|city|string| null: false|
|block|string| null: false|
|building|string|

### Association
- belongs_to :user


## cardsテーブル

|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|card_id|string|null: false|
|customer_id|string|null: false|

### Association
- belongs_to :user


## brandsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many :items


## categoriesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string| null: false|
|ancestry|string| index: false|

### Association
- has_many :items


## itemsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|null: false|
|price|integer|null: false|
|brand|references| foreign_key: true|
|status_id|integer| null: false|
|charge_id|integer| null: false|
|prefecture_id|integer| null: false|
|day_id|integer| null: false|
|category|references| null: false, foreign_key: true|
|seller|references| null: false, foreign_key: {to_table: :users}|
|buyer|references| foreign_key: { to_table: :users}|

### Association
- has_many :images dependent: :destroy
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- belongs_to :status
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"
