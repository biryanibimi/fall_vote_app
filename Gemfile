# frozen_string_literal: true

source "https://rubygems.org"

gem "sinatra"
gem "sinatra-contrib"
gem 'sinatra-activerecord'
gem "rackup"
gem "puma"
gem "pg"
gem "bootstrap"
gem "rake"

# 開発時の環境変数設定用
gem 'dotenv'

group :development do
  gem "sinatra-reloader"  # 開発時の自動リロード
end

group :development, :test do
  gem "rspec"  # テスト用
  gem "rack-test"  # テスト用
  gem 'dotenv'
end