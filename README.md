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
|birth_date|date|null: false|
|cellphone|string|null: false|
|point|integer|
### Association
- has_many :shipping_addresses, dependent: :destroy
- has_many :items, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_one :credit_card, dependent: :destroy
- has_one :address, dependent: :destroy
- has_many :likes, dependent: :destroy

## addressテーブル
|Column|Type|Options|
|------|----|-------|
|post_code|string|
|prefecture|string|
|city|string|
|block_number|string|
|building|string|
|user_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user

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
|user_id|integer|null: false,foreign_key: true|
### Association
- belongs_to :user

## credit_cardsテーブル
|Column|Type|Options|
|------|----|-------|
|number|integer|null: false|
|month|integer|null: false|
|year|integer|null: false|
|security_code|integer|null: false|
|user_id|integer|null: false,foreign_key: true|
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
|text|text|null: false|
|item_id|integer|null: false, foreign_key: true|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- belongs_to :item

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|string|null: false|
|price|integer|null: false|
|user_id|integer|null: false, foreign_key: true|
|condition_id|integer|null: false, foreign_key: true|
|brand_id|integer|null: false, foreign_key: true|
|size_id|integer|null: false, foreign_key: true|
|category_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :category, dependent: :destroy
- belongs_to :condition, dependent: :destroy
- has_one :deli_info, dependent: :destroy
- belongs_to :brand, dependent: :destroy
- belongs_to :user
- belongs_to :size, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :images, dependent: :destroy

## deli_infoテーブル
|Column|Type|Options|
|------|----|-------|
|burden|string|null: false|
|days|integer|null: false|
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