class PostsController < ApplicationController
  layout 'standard'
  before_action :fetch_user

  def index
    @posts = @user.posts.all
  end

  def show
    @post = @user.posts.find(params[:id])
  end

  private

  def fetch_user
    @user = User.find(params[:user_id])
  end
end
