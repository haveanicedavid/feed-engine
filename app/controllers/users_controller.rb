class UsersController < ApplicationController
  
  def show
    @analyses = Analysis.where(user_id: current_user.id)
    @saved_searches = Search.where(user_id: current_user.id, active?: true)
  end
end
