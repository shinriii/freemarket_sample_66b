FactoryBot.define do
  factory :address do
    address_firstname { "山田" }
    address_lastname {  "太郎" }
    address_kana_firstname { "ヤマダ" }
    address_kana_lastname { "タロウ" }
    zipcode { "111-1111" }
    prefectures {  "福岡県" }
    municipalities { "福岡市中央区福岡町" }
    address { "1-1" }
  end
end