require_relative "../skeleton/lib/00_tree_node.rb"
class KnightPathFinder
  def initialize(pos)
    @root_node = PolyTreeNode.new(pos)
  end
end