module BlogApi
  class PostsCollection < BaseCollection
    def published
      @scopes.push(
        -> (item) {
          # item[:published]
          item.fetch(:id).present?
        }
      )
    end
  end
end
