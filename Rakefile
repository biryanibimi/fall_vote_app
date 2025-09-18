# coding: utf-8
require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './app'

# app.rbを読み込む（ActiveRecordの設定のため）
require_relative 'app'

desc "DB作成とマイグレーションをまとめて実行"
task :setup => ["db:create", "db:migrate"]

desc "データベースをリセット（開発用）"
task :reset => ["db:drop", "db:create", "db:migrate"]