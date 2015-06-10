class AnalysesController < ApplicationController
  
  def index
    word = session["word"]
    tweets = SearchResults.new(word).all_tweets
    tweets_array = tweets.map { |tweet| tweet.text }
    user_id = session["user_id"]
    
    analyze = AylienAnalyze.new.grouped_analysis(tweets_array)
    
    @analysis = Analysis.create(user_id: user_id, keyword: word, analysis: analyze)
    
    redirect_to user_path(current_user)
  end
end