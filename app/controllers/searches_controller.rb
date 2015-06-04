class SearchesController < ApplicationController
  
  def index
  end
  
  def show
  end
  
  def create
  end
  
  def search_results
    @word = params["search"]["word"]
    session[:word] = @word
    redirect_to results_path
  end
  
  def search_results_display
    @word = session[:word]
    @tweets = SearchResults.new(@word).all_tweets
  end
  
end
