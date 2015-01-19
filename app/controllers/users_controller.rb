class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def show_current_user
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(:avatar => params[:user][:avatar])
    redirect_to :back
  end

end
