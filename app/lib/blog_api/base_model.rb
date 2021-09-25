module BlogApi
  class BaseModel
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    def initialize(attrs, errors = {})
      @attributes = attrs
      @errors = errors

      attrs.each do |key, value| 
        instance_variable_set("@#{key}", value)
      end
    end

    def persisted?
      id.present?
    end

    attr_reader :id, :attributes, :errors
  end
end