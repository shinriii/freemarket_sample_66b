class Address < ApplicationRecord
    belongs_to :user, optional: true
    validates :address_firstname, :address_lastname, :prefectures, :municipalities, :address ,presence: true
    validates :address_kana_firstname, :address_kana_lastname, presence: true
    validates :zipcode,presence: true
    validates :prefectures,presence: true
    
    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to_active_hash :prefecture
  end
end

