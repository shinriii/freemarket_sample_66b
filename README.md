## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|mail|string|null: false,unique:true|
|password|string|null: false,unique:true|
|family_name|string|null: false|
|given_name|string|null: false|
|family_name_kana|string|null: false|
|given_name_kana|string|null: false|
|birth_date|DATE|null: false|
|cellphone|string|null: false|
|post_code|string|
|prefecture|string|
|address|string|
|block_number|string|
|building|string|
|point|INT|
### Association
- has_many :shipping_addresses
- belongs_to :point
- has_many :items
- belongs_to :credit_cards

## shipping_addressesテーブル
|Column|Type|Options|
|------|----|-------|
|family_name|string|null: false|
|given_name|string|null: false|
|family_name_kana|string|null: false|
|given_name_kana|string|null: false|
|post_code|string|null: false|
|prefecture|string|null: false|
|address|string|null: false|
|block_number|string|null: false|
|building|string|
|telephone|string|
|user_id|INT|null: false,foreign_key: true|
### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|INT|null: false|
|month|INT|null: false|
|year|INT|null: false|
|security_code|INT|null: false|
|user_id|INT|null: false,foreign_key: true|
### Association
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|null: false,foreign_key: true|
|item_id|null: false,foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

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
|description|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :category
- belongs_to :condition
- belongs_to :deli-info
- belongs_to :brand
- belongs_to :users
- has_many :likes
- has_many :comments
- has_many :images

## deli-infoテーブル
|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|
|days|INT|null: false|
|prefecture|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|item_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :item

## conditionsテーブル
|Column|Type|Options|
|------|----|-------|
|level|string|null: false|
|condition_id|integer|null: false, foreign_key: true|
### Association
- has_many :items

## brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|
### Association
- has_many :items

## sizesテーブル
|Column|Type|Options|
|------|----|-------|
|value|string|null: false|
### Association
- has_many :items

## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|path|
|name|string|null: false|
### Association
- has_many :items