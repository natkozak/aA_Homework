  class LRUCache
    attr_accessor = :size

    def initialize(size)
      @size = size
      @cache = Array.new
    end

    def count
      @cache.count
    end

    def add(el)
      # @cache.delete(el) if @cache.include?(el)
      # @cache.delete_at(0) if self.count > @size
      # @cache << el
      if @cache.include?(el)
        @cache.delete(el)
      elsif count >= @size
        @cache.shift
      end
      @cache << el
    end

    def show
      p @cache
    end

    private
    # helper methods go here!

  end

  johnny_cache = LRUCache.new(4)

  johnny_cache.add("I walk the line")
  johnny_cache.add(5)

  johnny_cache.count # => returns 2

  johnny_cache.add([1,2,3])
  johnny_cache.add(5)
  johnny_cache.add(-5)
  johnny_cache.add({a: 1, b: 2, c: 3})
  johnny_cache.add([1,2,3,4])
  johnny_cache.add("I walk the line")
  johnny_cache.add(:ring_of_fire)
  johnny_cache.add("I walk the line")
  johnny_cache.add({a: 1, b: 2, c: 3})


  johnny_cache.show # => prints [[1, 2, 3, 4], :ring_of_fire, "I walk the line", {:a=>1, :b=>2, :c=>3}]