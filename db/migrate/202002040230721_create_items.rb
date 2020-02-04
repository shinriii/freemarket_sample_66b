class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.references :condition, foreign_key: true
      t.references :prefecture, foreign_key: true
      t.references :delivery_day, foreign_key: true
      t.references :delivery_burden, foreign_key: true
      t.integer :parent_category_id
      t.integer :child_category_id
      t.references :user, foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
