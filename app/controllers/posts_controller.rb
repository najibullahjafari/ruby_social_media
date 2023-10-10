class PostsController < ApplicationController
  before_action :set_user

  def index
    @posts = @user.posts
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end
