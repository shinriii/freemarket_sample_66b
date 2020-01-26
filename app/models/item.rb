class Item < ApplicationRecord
    validates :image, :name, :description, :price, :condition_id, :prefecture_id, :delivery_days_id, :delivery_burden_id, :category_id, presence: true
end
