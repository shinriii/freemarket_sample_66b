# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @condition = %option{value:""} ---,
#             %option{value:"新品、未使用"} 新品 未使用,
#             %option{value:"未使用に近い"} 未使用に近い
#             %option{value:"目立った傷や汚れなし"} 目立った傷や汚れなし
#             %option{value:"やや傷や汚れあり"} やや傷や汚れあり
#             %option{value:"傷や汚れあり"} 傷や汚れあり
#             %option{value:"全体的に状態が悪い"} 全体的に状態が悪い

User.create!(
nickname:'ひの',
firstname:'日野',
lastname:'としひろ',
kana_firstname:'ヒノ',
kana_lastname:'トシヒロ',
birthday:'2020-1-1',
email:'hino@gmail.com',
password: 'hino123456'
)

Item.create!(
  name:'バッグ',
  category:'レディース',
  brand:'ルイヴィトン',
  delivery_origin:'テスト',
  description:'新品です',
  price:'10000',
  condition_id:'1',
  prefecture_id:'2',
  delivery_days_id:'1',
  delivery_burden_id:'1',
  category_id:'1',
  user_id:'3'
)