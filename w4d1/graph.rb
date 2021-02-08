#Creating a node should give us access to its value and the nodes to which it connects us - in the case of a bidirectional graph, this will be all its neighbors. For any given node, we should be able to add a neighboring node.

class GraphNode
  attr_accessor :val, :neighbors

  def initialize(val)
    self.val = val
    self.neighbors = []
  end

  def add_neighbor(node)
    self.neighbors << node
  end

  def bfs(node, target_value)
    visited = Set.new()
    
    queue = []
    queue << self
    while queue.length > 0
      node = queue.shift
      return first_node if node.val == target_value
      return nil if (visited.include?(node.val))
      visited.add(node.val)
      queue.concat(node.neighbors)
    end
  end

  def depth_first(node, visited = Set.new())
  # if this node has already been visited, then return early
  return nil if (visited.include?(node.val))

  # otherwise it hasn't yet been visited,
  # so print its val and mark it as visited.
  puts node.val
  visited.add(node.val)

  # then explore each of its neighbors
    node.neighbors.each do |neighbor|
      depth_first(neighbor, visited);
    end
  end

end
a = GraphNode.new('a')
b = GraphNode.new('b')
c = GraphNode.new('c')
d = GraphNode.new('d')
e = GraphNode.new('e')
f = GraphNode.new('f')
a.neighbors = [b, c, e]
c.neighbors = [b, d]
e.neighbors = [a]
f.neighbors = [e]

p a.bfs(a, "b")

p a.bfs(a, "f")