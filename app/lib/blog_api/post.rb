# frozen_string_literal: true

module BlogApi
  class Post < BaseModel
    attr_reader :title, :body, :comments_path

    def comments
      json_response = BlogApi::Client.get_request(comments_path)
      CommentsCollection.new(json_response.fetch('comments'), post_id: id, post: self)
    end
  end
end
