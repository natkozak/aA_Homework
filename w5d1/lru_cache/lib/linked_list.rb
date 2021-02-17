class DoubleLinkedListNode
  attr_reader = :prev, :next

  def initialize(n = nil)
    @prev = nil
    @next = nil
    @node = n
  end

  def append(node)
    @next.prev = nil
    @prev.next = nil
    @next = node
    node.prev = self
  end

  protected
  attr_writer :prev, :next
end

class DoubleLinkedList
  def initialize
    @head = DoubleLinkedListNode.new
    @tail = DoubleLinkedListNode.new
    @length = 0
    @head
  end


end