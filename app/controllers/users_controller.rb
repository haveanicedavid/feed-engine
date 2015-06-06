class UsersController < ApplicationController
  
  def show
    @analyses = Analysis.where(user_id: current_user)
  end
end
