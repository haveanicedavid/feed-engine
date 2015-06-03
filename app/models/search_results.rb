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
      tweet[:text]
    end
  end
  
end