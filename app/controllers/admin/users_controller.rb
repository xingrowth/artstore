class Admin::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin

  def index
    @users = User.all
  end

  def manager
    @user = User.find(params[:id])
    @user.manager!
    redirect_to :back
  end

  def consumer
    @user = User.find(params[:id])
    @user.consumer!
    redirect_to :back
  end

end
