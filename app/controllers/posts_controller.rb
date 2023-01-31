class PostsController < ApplicationController
    before_action: fetch_user

    def index
        @posts = @user.posts.all
    end

    def show
        @post = @user.find(params[:id])
    end

    private

    def fetch_user
        @user = User.find(params[:user_id])
    end
end
