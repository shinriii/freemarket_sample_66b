class Address < ApplicationRecord

    belongs_to :user, optional: true
    belongs_to :prefecture
    
    VALID_POSTAL_CODE = /\A\d{3}-\d{4}\z/i
    VALID_KATAKANA_REGEX = /\A[\p{katakana}\p{blank}ー－]+\z/

    validates :address_firstname, presence: true, length: { maximum: 35 }
    validates :address_lastname, presence: true, length: { maximum: 35 }
    validates :address_kana_lastname, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
    validates :address_kana_firstname, presence: true, length: { maximum: 35 }, format: { with: VALID_KATAKANA_REGEX, message: 'はカタカナで入力して下さい'}
    validates :municipalities, :address ,presence: true
    validates :zipcode, presence: true, length: { maximum: 8 }, format: { with: VALID_POSTAL_CODE, message: 'のフォーマットが不適切です' }
    validates :prefecture_id,presence: true
end

