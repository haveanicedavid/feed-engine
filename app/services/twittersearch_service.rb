require 'twitter'

class TwittersearchService
  attr_reader :client
  
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_SECRET_KEY"]
      config.access_token        = ENV["TWITTER_ACCESS"]
      config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
    end
  end
  
  def search_by(search)
    client.search(search, lang: "en").first(20)
  end
end