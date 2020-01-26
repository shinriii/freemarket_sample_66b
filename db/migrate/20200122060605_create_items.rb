class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :image
      t.string :name
      t.string :description
      t.integer :price
      t.integer :user_id
      t.integer :condition_id
      t.integer :prefecture_id
      t.integer :delivery_days_id
      t.integer :delivery_burden_id
      t.integer :brand_id
      t.integer :size_id
      t.integer :category_id
      t.timestamps
    end
  end
end
