set -o errexit

bundle install

# 開発中＆本番デプロイ
bundle exec rake db:drop
bundle exec rake db:prepare
bundle exec rake db:seed

# 本番運用開始後
# bundle exec rake db:prepare