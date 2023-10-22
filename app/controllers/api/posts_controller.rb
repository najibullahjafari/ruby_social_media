# app/controllers/api/posts_controller.rb
module Api
  class PostsController < ApplicationController
    before_action :set_user

    def index
      @posts = @user.posts
      render json: @posts
    end

    private

    def set_user
      @user = User.find(params[:user_id])
    end
  end
end
