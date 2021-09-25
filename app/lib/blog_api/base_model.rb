module BlogApi
  class BaseModel
    def initialize(attrs, errors = {})
      @attributes = attrs
      @errors = errors

      attrs.each do |key, value| 
        instance_variable_set("@#{key}", value)
      end
    end

    attr_reader :id, :attributes, :errors
  end
end