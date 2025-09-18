require_relative '../models/vote'

# 初期データ挿入処理
Vote.create([
  {beverage_name: "ほうじ茶香る焼き芋ムースティーラテ🄬", shop_name: "スターバックス", url: "https://menu.starbucks.co.jp/4524785611573", vote_counts: 0},
  {beverage_name: "洋なし 生キャラメル フラペチーノ🄬", shop_name: "スターバックス", url: "https://menu.starbucks.co.jp/4524785584778", vote_counts: 0}
])