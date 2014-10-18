# -*- encoding: UTF-8 -*-

require 'twitter'
require 'pp'
$LOAD_PATH << File.dirname(__FILE__)
require "pass"


class Bot
    include OauthInfo
   

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

            # ツイートする。
            client.update(tweet.sample)
    
    end
end


bot = Bot.new
bot.update

# client.update("I'm tweeting")

# ハッシュタグ"ruby"を検索する。
# client.search("#ruby -rt", :count => 10, :result_type => "recent").collect do |tweet|
#    pp "#{tweet.user.screen_name}: #{tweet.text}"
# end
