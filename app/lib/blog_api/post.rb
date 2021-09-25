module BlogApi
  class Post < BaseModel
    attr_reader :title, :body
  end
end