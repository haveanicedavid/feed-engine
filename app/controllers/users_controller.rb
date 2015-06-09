class UsersController < ApplicationController
  skip_before_action :check_email, :only => [:edit]
  def show
    @analyses = Analysis.where(user_id: current_user.id)
    @saved_searches = Search.where(user_id: current_user.id, active?: true)
  end

  def edit
  end

  def update
    current_user.update(params[:email])
    redirect_to user_path(current_user)
  end
end
