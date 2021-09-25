class PostsController < ApplicationController
  def index
    blogapi_client = BlogApi::Client.new
    @posts = blogapi_client.posts
  end
end