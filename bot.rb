# coding:UTF-8

require 'rubygems'
require 'bundler/setup'
require 'twitter'
require 'pp'

require_relative 'pass'


class Bot
    include OauthInfo

    USER_NAME = "shifumin_bot"


    def initialize
            @con_key = keys[:con_key]
            @con_secret = keys[:con_secret]
            @acc_token = keys[:acc_token]
            @acc_token_secret = keys[:acc_token_secret]
    end


    def update
            client = Twitter::REST::Client.new do |config|
                config.consumer_key = @con_key
                config.consumer_secret = @con_secret
                config.access_token = @acc_token
                config.access_token_secret = @acc_token_secret
            end

            # ファイルからツイートを読み込み配列に格納する
            tweet = File.read('./tweet.txt').split("\n")

            # 直近のツイートを読み込み配列に格納する
            rec_tweet = Array.new
            client.user_timeline(USER_NAME, :count =>12).each do |t|
            rec_tweet << "#{t.text}"
            end

            # ツイートする。
            new_tweet = (tweet - rec_tweet).sample
            client.update(new_tweet)
            pp new_tweet


            # 実験中
=begin
            a = Array.new
            client.followers("shifumin").each do |f|
            a << "#{f}"
            end
            puts client.followers("shifumin")
=end
    end
end


bot = Bot.new
bot.update


# client.update("I'm tweeting")

# ハッシュタグ"ruby"を検索する。
# client.search("#ruby -rt", :count => 10, :result_type => "recent").collect do |tweet|
#    pp "#{tweet.user.screen_name}: #{tweet.text}"
# end
