class PostsController < ApplicationController
  def index
    blogapi_client = BlogApi::Client.new
    @posts = blogapi_client.posts
  end

  def show
    blogapi_client = BlogApi::Client.new
    @post = blogapi_client.get_post(params[:id])
    @comments = @post.comments
    @comment = @comments.build
  end

  def new
    @post = BlogApi::Post.new({})
  end

  def create
    @post = BlogApi::Client.new.create_post(post_params)
    redirect_to @post
  end

  private

  def post_params
    params.require(:blog_api_post).permit(:title, :body)
  end
end