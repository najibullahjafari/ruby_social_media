class PostsController < ApplicationController
  def index
    @user = User.includes(posts: :comments).find(params[:user_id])
    @posts = @user.posts.includes(comments: :user)
  end

  # This action is for rendering the form to create a new post.
  def new
    @post = current_user.posts.build
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
