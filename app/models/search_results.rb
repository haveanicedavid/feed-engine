class SearchResults
  attr_reader :service

  def initialize(search)
    @search = search
  end

  def self.service
    @service ||= TwittersearchService.new
  end

  def all_tweets
    TwittersearchService.new.search_by(@search).map do |tweet|
      t = Tweet.new
      t.text = tweet.attrs[:text]
      t.created_at = tweet.attrs[:created_at]
      t.screen_name = tweet.attrs[:user][:screen_name]
      t
    end
  end

end

class Tweet < OpenStruct

end
