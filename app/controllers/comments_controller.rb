class CommentsController < ApplicationController
  def create
    post_id = params.fetch(:blog_api_post_id)
    @comment = BlogApi::Client.new.create_comment(comment_params.merge({ name: "Anonymous", post_id: post_id }))
    respond_to do |format|
      format.html { redirect_to post_path(post_id) }
      format.js
    end
  end

  private

  def comment_params
    params.require(:blog_api_comment).permit(:body)
  end
end
