module BlogApi
  class PostsCollection < BaseCollection
    def each
      all.each do |attributes|
        yield Post.new(attributes)
      end
    end

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
