class PostsController < ApplicationController
  def index
    blogapi_client = BlogApi::Client.new
    @posts = blogapi_client.posts
  end

  def show
    blogapi_client = BlogApi::Client.new
    @post = blogapi_client.get_post(params[:id])
    @comments = @post.comments
  end

  def new
    @post = BlogApi::Post.new({})
  end
end