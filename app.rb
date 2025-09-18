# frozen_string_literal: true
###############################
# 環境設定
###############################
require 'sinatra'
require 'dotenv/load'
require 'yaml'
require 'sinatra/reloader'
require 'active_record'
require 'erb'
require 'dotenv/load'
require './models/vote.rb'

# 環境変数
environment = ENV['RACK_ENV']

# 開発環境フラグ
dev_flag = environment == 'development'

# 開発環境のみ実行
if dev_flag
  require 'logger'

  # ログ出力設定
  logfile = File.open('log/development.log', 'a')
  logfile.sync = true
  LOGGER = Logger.new(logfile)
end

# DB接続設定
# エイリアス有効でdatabase.ymlを読み込む
db_config = YAML.load_file('config/database.yml', aliases: true)
ActiveRecord::Base.establish_connection(db_config[environment])

###############################
# メイン処理
###############################

get '/' do
  @title = 'この秋なに飲む？'
  Choices = Vote.all
  erb :index
end

post '/cast' do
  @title = '投票ありがとうございます!'
  @vote  = params['vote'].to_i
  @choice = Vote.find(@vote)
  # 投票カウントアップ
  @choice.increment!(:vote_counts)
  erb :cast
end

get '/results' do
  Votes = Vote.order("vote_counts DESC")
  @title = '投票結果はこちら:'
  erb :results
end

###############################
# 終了処理
###############################
#logfile.close
#LOGGER.close