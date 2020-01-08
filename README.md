## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|VARCHAR|null: false|
|mail|VARCHAR|null: false,unique:true|
|password|VARCHAR|null: false,unique:true|
|family_name|VARCHAR|null: false|
|given_name|VARCHAR|null: false|
|family_name_kana|VARCHAR|null: false|
|given_name_kana|VARCHAR|null: false|
|birth_date|DATE|null: false|
|cellphone|VARCHAR|null: false|
|post_code|CHAR|
|prefecture|VARCHAR|
|address|VARCHAR|
|block_number|VARCHAR|
|building|VARCHAR|
|point|INT|
### Association
belongs_to :shipping_address
belongs_to :point
belongs_to :item
belongs_to :credit_card

## shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|VARCHAR|null: false|
|given_name|VARCHAR|null: false|
|family_name_kana|VARCHAR|null: false|
|given_name_kana|VARCHAR|null: false|
|post_code|CHAR|null: false|
|prefecture|VARCHAR|null: false|
|address|VARCHAR|null: false|
|block_number|VARCHAR|null: false|
|building|VARCHAR|
|telephone|VARCHAR|
|user_id|INT|null: false,foreign_key: true|
### Association
belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|INT|null: false|
|month|INT|null: false|
|year|INT|null: false|
|security_code|INT|null: false|
|user_id|INT|null: false,foreign_key: true|
### Association
has_many :users

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|null: false,foreign_key: true|
|item_id|null: false,foreign_key: true|
### Association
belongs_to :user
belongs_to :item

## comenntsテーブル
|Column|Type|Options|
|------|----|-------|
|text|TEXT|null: false|
|item_id|INT|null: false, foreign_key: true|
|user_id|INT|null: false, foreign_key: true|
### Association
- belongs_to :user

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|CHAR(40)|null: false|
|description|VARCHAR|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :category
- belongs_to :condition
- belongs_to :deli-info
- belongs_to :brand
- has_many :users
- has_many :likes
- has_many :comments
- has_many :images

## deli-infoテーブル
|Column|Type|Options|
|------|----|-------|
|burden|VARCHAR|null: false|
|days|INT|null: false|
|prefecture|VARCHAR|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|VARCHAR|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|level|VARCHAR|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|VARCHAR|
|item_id|integer|null: false, foreign_key: true|
### Association
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|value|VARCHAR|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|path|
|name|VARCHAR|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- has_many :items