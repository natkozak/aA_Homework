  class DoubleLinkedList
    attr_reader :prev, :next, :val

    def initialize(val = nil)
      @val = val
      @prev = nil
      @next = nil
    end

    def append(node)
      node.prev.next = nil if node.prev
      self.next.prev = nil if self.next

      node.prev = self
      self.next = node
    end

    def detach
      self.prev.next = nil if self.prev
      self.next.prev = nil if self.next
    end

    def inspect
      
    end


  end
  
  class LRUCache
    attr_accessor = :size

    def initialize(size)
      @size = size
      @cache = Array.new
    end

    def count
      @cache.count
    end

    def add(ele)
      # @cache.delete(ele) if @cache.include?(ele)
      # @cache.delete_at(0) if self.count > @size
      # @cache << ele
      if @cache.include?(ele)
        @cache.delete(ele)
      elsif count >= @size
        @cache.shift
      end
      @cache << ele
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