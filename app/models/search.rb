class Search
  
  def initialize(search)
    @search = search
  end
  
  def self.service
    @service ||= TwittersearchService.new
  end
  
  def all
    service.search_by(@search).attrs[:statuses].map do |tweet|
      tweet[:text]
    end
  end
end