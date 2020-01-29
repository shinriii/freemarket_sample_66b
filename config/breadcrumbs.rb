crumb :root do
  link "Fmarket", root_path
end

crumb :index do
  link "マイページ", mypages_path
end

crumb :logouts do
  link "ログアウト", logouts_path
  parent :index
end

crumb :profiles do
  link "プロフィール", profiles_path
  parent :index
end

crumb :cards do
  link "支払い方法", cards_path
  parent :index
end

crumb :identity_informations do
  link "本人情報の登録", identity_informations_path
  parent :index
end