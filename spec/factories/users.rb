FactoryBot.define do
  factory :user do
    nickname              {"太郎！"}
    email                 {"kkk@gmail.com"}
    password              {"kkkkkkk"}
    firstname              {"山田"}
    lastname              {"太郎"}
    kana_firstname              {"ヤマダ"}
    kana_lastname              {"タロウ"}
    birthday              {"2020-01-21"}
  end
end