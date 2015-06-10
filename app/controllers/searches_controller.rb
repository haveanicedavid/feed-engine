class SearchesController < ApplicationController
  respond_to :json

  def index
    @saved_searches = Search.where(user_id: current_user.id, active?: true)
  end

  def show
  end

  def create
    @search = Search.new(search_params)
   
    if @search.save
      @search.update(user_id: current_user.id)
      # flash[:success] = " #{@search.word} is a saved search!"
      redirect_to searches_path
    else
      flash[:errors] = @search.errors.full_messages.join(", ")
      redirect_to user_path(current_user)
    end
  end
  
  def update
    @search = Search.find(params["id"])
    if @search.update(active?: false)
      flash[:success] = "Your search for #{@search.word} has been deactivated."
      redirect_to user_path(current_user)
    else
      flash[:errors] = @search.errors.full_messages.join(", ")
      redirect_to user_path(current_user)
    end
  end

  def search_results
    @word          = params["word"]
    session[:word] = @word
    @tweets        = SearchResults.new(@word).all_tweets
    respond_with @tweets, status: 201, location: user_path(current_user)
  end
  
  private
  
  def search_params
    params.require(:search).permit(:user_id, :word, :active?)
  end
end
