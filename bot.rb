# coding:UTF-8

require 'bundler/setup'
require 'dotenv'
require 'twitter'
require 'pp'

class Bot
  USER_NAME = 'shifumin_bot'

  def initialize
    Dotenv.load
    @con_key = ENV['CONSUMER_KEY']
    @con_secret = ENV['CONSUMER_SECRET']
    @acc_token = ENV['ACCESS_TOKEN']
    @acc_token_secret = ENV['ACCESS_TOKEN_SECRET']
  end

  def update
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = @con_key
      config.consumer_secret     = @con_secret
      config.access_token        = @acc_token
      config.access_token_secret = @acc_token_secret
    end

    # ファイルからツイートを読み込み配列に格納する
    tweet = File.read('./tweet.txt').split("\n")

    # 直近のツイートを読み込み配列に格納する
    rec_tweet = []
    #rec_tweet = Array.new
    client.user_timeline(USER_NAME, count: 30).each do |t|
      rec_tweet << "#{t.text}"
    end

    # ツイートする。
    new_tweet = (tweet - rec_tweet).sample
    client.update(new_tweet)
    pp new_tweet
  end
end

bot = Bot.new
bot.update
