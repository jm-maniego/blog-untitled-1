module BlogApi
  class BaseModel
    def initialize(attrs, errors = {})
      @attrs = attrs
      @errors = errors

      attrs.each do |key, value| 
        instance_variable_set("@#{key}", value)
      end
    end

    attr_reader :errors
  end
end