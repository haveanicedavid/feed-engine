class SearchResults
  attr_reader :service

  def initialize(search)
    @search = search
  end

  def self.service
    @service ||= TwittersearchService.new
  end

  def all_tweets
    TwittersearchService.new.search_by(@search).attrs[:statuses].map do |tweet|
      t = Tweet.new
      t.text = tweet[:text]
      t.created_at = tweet[:created_at]
      t.screen_name = tweet[:user][:screen_name]
      t
    end
  end

end

class Tweet < OpenStruct

end
