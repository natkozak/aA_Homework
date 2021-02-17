require 'lru_cache'
require 'rspec'

describe LRUCache do
  subject(:small_cache) { LRUCache.new(5) }
  subject(:big_cache) { LRUCache.new(10) }

  describe "#initialize" do 
    it "should accept one number as an argument" do 
      expect { LRUCache.new(5) }.not_to raise_error
      expect { LRUCache.new }.to raise_error
    end

    it "should set @size to size" do 
      expect(small_cache.instance_variable_get(:@size)).to eq(5)
      expect(big_cache.instance_variable_get(:@size)).to eq(10)
    end

    it "should set @cache to an empty array" do 
      expect(small_cache.instance_variable_get(:@cache)).to eq([])
    end
  end

  describe "#count" do
    it "should return the number of elements in the cache" do
      cache = small_cache.instance_variable_get(:@cache)
      expect(small_cache.count).to eq(0)
      small_cache.instance_variable_set(:@cache, [1,2,3,4,5])
      expect(small_cache.count).to eq(5)
    end
  end

  describe "#add(el)" do
    it "should add elements to cache" do
      small_cache.add(1)
      small_cache.add(2)
      small_cache.add(3)
      expect(small_cache.instance_variable_get(:@cache)).to eq([1,2,3])
    end

    it "should delete elements if they're already included" do
      small_cache.add(1)
      small_cache.add(2)
      small_cache.add(3)
      small_cache.add(2)
      expect(small_cache.instance_variable_get(:@cache)).to eq([1,3,2])
    end

    it "should return an array of the element" do
      expect(small_cache.add(3)).to eq([3])
    end
  end

  describe "#show" do
    it "should show the items in the cache, with the LRU item first" do
      small_cache.add(1)
      small_cache.add(2)
      small_cache.add(3)
      expect(small_cache.show).to eq([1,2,3])
    end
  end
end