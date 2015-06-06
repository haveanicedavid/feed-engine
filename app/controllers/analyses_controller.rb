class AnalysesController < ApplicationController
  
  def create
    tweets_array = params["tweets"].split("|||||")
    word = params["word"]
    user_id = params["user_id"]
    
    analyze = AylienAnalyze.new.grouped_analysis(tweets_array)
    
    @analysis = Analysis.create(user_id: user_id, keyword: word, analysis: analyze)
    
    redirect_to user_path(current_user)
  end
  
end