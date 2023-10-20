class UsersController < ApplicationController
  def index
    @users = User.order(id: :asc)
  end

  def show
    @user = User.find(params[:id])
  end
end
