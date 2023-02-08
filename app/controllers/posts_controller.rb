class PostsController < ApplicationController
  layout 'standard'
  before_action :fetch_user

  def index
    @posts = @user.posts.includes(:author, :comments, :likes)
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  def new
    @post = @user.posts.new
    render :new, locals: { post: @post }
  end

  def create
    @post = @user.posts.new(post_params)
    respond_to do |format|
      format.html do
        if @post.save
          flash[:success] = 'Post created successfully'
          redirect_to user_posts_path(@user)
        else
          flash[:error] = 'Post not created'
          render :new, locals: { post: @post }
        end
      end
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
