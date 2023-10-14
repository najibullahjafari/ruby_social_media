require 'will_paginate/array'

class UsersController < ApplicationController
  def index
    @users = User.all
    # Use the correct syntax to render the index view
    render :index
  end

  # In your UsersController
  def show
    @user = User.find(params[:id]) # Find the user by ID
    page = params[:page] || 1
    posts_per_page = 3
    @posts = @user.posts.order(created_at: :desc)
      .paginate(page:, per_page: posts_per_page)
  end
end
