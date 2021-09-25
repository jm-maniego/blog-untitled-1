module BlogApi
  class Comment < BaseModel
    def initialize(attrs, errors)
      @post_id = attrs.symbolize_keys.fetch(:post_id) 
      super
    end
  end
end