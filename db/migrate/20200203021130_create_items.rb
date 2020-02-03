class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.integer :condition_id
      t.integer :prefecture_id
      t.integer :delivery_days_id
      t.integer :delivery_burden_id
      t.integer :parent_category_id
      t.integer :child_category_id
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
