class PostsController < ApplicationController
  def index
    @user = User.includes(posts: :comments).find(params[:user_id])
    @posts = @user.posts.includes(comments: :user)
  end

  # This action is for rendering the form to create a new post.
  def new
    if user_signed_in?
      @post = current_user.posts.build
    else
      redirect_to new_user_session_path, alert: 'You must be logged in to create a post.'
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body) # Add other post attributes if any
  end
end
