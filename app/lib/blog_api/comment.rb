module BlogApi
  class Comment < BaseModel
    attr_reader :name, :body

    def initialize(attrs, errors = {})
      @post_id = attrs.symbolize_keys.fetch(:post_id) 
      super
    end
  end
end