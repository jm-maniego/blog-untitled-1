module BlogApi
  class BaseModel
    include ActiveModel::Conversion
    extend ActiveModel::Naming

    attr_reader :id, :attributes, :errors, :created_at, :updated_at

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

  end
end