class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @parent=nil
        @children=[]
        @value=value
    end

    def parent=(node)
        return if parent == node
        if parent != node && parent != nil
          parent.children.delete(self)
        end
        @parent = node
        if node != nil
          node.children << self
        else
          return nil
        end
    end

    def add_child(child_node)
        child_node.parent=self
    end


    def remove_child(child_node)
        raise "not a child" unless self.children.include?(child_node)
        child_node.parent=nil
    end

    def dfs(target_value)
      return self if self.value == target_value
      children.each do |child|
        curr_node = child.dfs(target_value)
        return curr_node unless curr_node == nil
      end
      nil
    end

    def bfs(target_value)
        queue=[]
        queue<<self
        until queue.empty?
            if queue.first.value==target_value
                return queue.first
            else
                queue.concat(queue.first.children)
                queue.shift
            end   
        end
        nil
    end

end