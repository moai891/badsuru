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
|nickname|string| null: false|index:true|
|phonenumber|string| unique: true|
|old|integer| null: false|numericality: true| <!-- active hash使用-->
|job|integer| null: false|<!-- active hash使用-->
|email|string|null: false|
|experience|integer|numericality: true|
|practice_times|integer| null:false|<!-- active hash使用-->
|detail|text|
|club|string|
|avatar|string|

### Association
- has_many :groups, through:members, dependent: :destroy
- has_many :practices, dependent: :destroy
- has_many :members
- has_many :messages, dependent: :destroy
- has_many :joinings, dependent: :destroy

## groupsテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|detail|text|
|avatar|string|

### Association
- has_many :users, through:members, dependent: :destroy
- has_many :members
- has_many :messages, through:members, dependent: :destroy

## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|references|foreign_key: true|
|group_id|references|foreign_key: true|

### Association
- belongs_to :user
- belongs_to :group


## messegesテーブル

|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|text|
|user_id|references|foreign_key: true|
|group_id|references|foreign_key: true|

 
### Association
- belongs_to :user
- belongs_to :group


## practicesテーブル

|Column|Type|Options|
|------|----|-------|
|name|string| null: false|index:true|
|date|date| null: false|index:true|
|day|integer|
|place|string|
|detail|text|
|member_limit|integer|
|start_time|time|
|end_time|time|
|user_id|references| foreign_key: true|<!-- 練習の代表 -->
|group_id|references|foreign_key: true|<!-- 所属グループ -->

### Association
- has_many   :joinings, dependent: :destroy
- belongs_to :user
- belongs_to :group

##  joiningsテーブル

|Column|Type|Options|
|------|----|-------|
|status|integer|<!-- active hash使用-->
|practice_id|refernces| foreign_key: true|
|user_id|refernces| foreign_key: true|

### Association
- belongs_to :user
- belongs_to :practice
