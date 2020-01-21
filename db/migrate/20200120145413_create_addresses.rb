class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :address_firstname, null: false
      t.string :address_lastname, null: false
      t.string :address_kana_firstname, null: false
      t.string :address_kana_lastname, null: false
      t.string :zipcode, null: false
      t.string :prefectures, null: false
      t.string :municipalities, null: false
      t.text :address, null: false
      t.string :building
      t.bigint :phone_number
      t.references :user
      t.timestamps
    end
  end
end
