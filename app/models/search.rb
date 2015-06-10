class Search < ActiveRecord::Base
  belongs_to :user

  def self.run_saved_searches
    count = 0
    aylien = AylienAnalyze.new
    where(active?: true).each do |search|
      tweets = SearchResults.new(search.word).all_tweets.map do |tweet|
        tweet.text
      end
      analyze = aylien.grouped_analysis(tweets)
      analysis = Analysis.create(user_id: search.user_id, keyword: search.word, analysis: analyze)
      UserMailer.daily_digest_email(search.user, analysis).deliver_later
      count += 1
    end
    puts "#{count} searches analyzed."
  end
end
