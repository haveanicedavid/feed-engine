class UsersController < ApplicationController
  skip_before_action :check_email, :only => [:edit, :update]
  def show
    @analyses = Analysis.where(user_id: current_user.id)
    @saved_searches = Search.where(user_id: current_user.id, active?: true)
  end

  def edit
  end

  def update
    if current_user.update(email: params[:user][:email])
      redirect_to user_path(current_user)
    else
      flash[:error] = "didn't work"
    end
  end

  def email
    UserMailer.daily_digest_email(current_user).deliver_now
    redirect_to current_user
  end

end
