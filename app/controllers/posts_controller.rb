class PostsController < ApplicationController
  # before_action :set_post, only: [:show, :like, :create_comment]
  # before_action :authenticate_user, only: [:like, :create_comment]

  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts.includes(:comments) # Use 'includes' to preload comments
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
    @comment = Comment.new # Initialize a new comment
  end

  def new
    @post = Post.new
    @user = current_user
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to user_path(current_user), notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def like
    @post = Post.find(params[:post_id]) # Fetch the post you want to like
    @like = current_user.likes.new(post: @post)

    if @like.save
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id), notice: 'You liked!'
    else
      redirect_to user_post_path(user_id: @post.author.id, id: @post.id),
                  alert: 'Something went wrong while liking this post.'
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end

  def comment_params
    params.require(:comment).permit(:text)
  end

  def set_post
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:id])
  end
end
