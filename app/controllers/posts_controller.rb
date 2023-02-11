class PostsController < ApplicationController
  # layout 'standard'
  before_action :fetch_user

  def index
    @posts = @user.posts.includes(:author, :comments)
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = Post.new
    # render :new, locals: { post: @post }
  end

  def create
    new_post = Post.new(post_params)
    new_post.author = @user
    if new_post.save
      flash[:success] = 'Post created successfully'
      redirect_to user_posts_path(@user)
    else
      flash[:error] = 'Post not created'
      render :new, locals: { post: @post }
    end
  end

  private

  def fetch_user
    @user = User.find(params[:user_id])
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
