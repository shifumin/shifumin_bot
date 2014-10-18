require 'twitter'
require 'pp'

client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "5byOBSZgmXC1ScL5ira7EPs81"
    config.consumer_secret     = "fFoeepTlrZgjhK55UgxMGvKXPDMkVMGuoZEVLLNb6LlXZuuB9Z"
    config.access_token        = "2855463554-lCiFIgJt9p35FUllssbT7nXSmOppz0mos85yCLi"
    config.access_token_secret = "0wW3EG9yVUwoJTu7xiryTnsiWOmkOU9vp8Dyuqi2YFb3Y"
end

# ツイートする。
client.update("I'm tweeting")

# ハッシュタグ"ruby"を検索する。
# client.search("#ruby -rt", :count => 10, :result_type => "recent").collect do |tweet|
#    pp "#{tweet.user.screen_name}: #{tweet.text}"
# end
