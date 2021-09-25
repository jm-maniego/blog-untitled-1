module BlogApi
  class BaseCollection
    def initialize(items)
      @items = items
      @scopes = []
    end
  
    def all
      @items.select do |item|
        @scopes.all? {|scope| scope.call(item) }
      end
    end
  
    def filter(values)
      values.each do |key, value|
        @scopes.push(-> (item) { item.send(key) === value })
      end
    end

    def length
      @items.length
    end
  end
end