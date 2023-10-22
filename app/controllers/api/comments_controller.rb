# app/controllers/api/comments_controller.rb
module Api
  class CommentsController < ApplicationController
    before_action :set_post

    def index
      @comments = @post.comments
      render json: @comments
    end

    private

    def set_post
      @post = Post.find(params[:post_id])
    end
  end
end
