class UsersController < ApplicationController
  skip_before_action :check_email, :only => [:edit, :update]

  def show
    @analyses = Analysis.where(user_id: current_user.id)  
  end

  def edit
  end

  def update
    if current_user.update(email: params[:user][:email])
      redirect_to user_path(current_user)
    end
  end  
end
