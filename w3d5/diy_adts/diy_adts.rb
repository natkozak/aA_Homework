class Stack
  def initialize(stack)
    @stack = stack
  end

  def push(el)
    @stack.push(el)
  end

  def pop
    @stack.pop
  end

  def peek
    @stack[-1]
  end
end

class Queue
  def initialize(queue)
    @queue = queue
  end

  def enqueue(ele)
    @queue.push(ele)
  end

  def dequeue
    @queue.shift
  end

  def peek
    @queue[0]
  end
end

class Map
  def initialize(map)
    @arr = Array.new { Array.new(2, []) }
  end

  def set(key, value)
    unless @arr.include?(key)
      @arr.each do |subArr|
        subArr[0] = key
        subArr[1] = value
      end
    end
  end

  def get(key)
    @arr.each do |subArr|
      return subArr[1] if subArr[0] == key
    end
  end

  def delete(key)
    @arr.each do |subArr|
      if subArr[0] == key
        @arr.split(subArr).join
      end
    end
  end

  def show
    @arr
  end


end