module BlogApi
  class CommentsCollection < BaseCollection
    def initialize(items, post: nil, post_id:)
      super(items)
      @post_id = post_id
    end
    attr_reader :post, :post_id

    def build
      Comment.new({
        post_id: post_id,
        post: post
      })
    end
  end
end