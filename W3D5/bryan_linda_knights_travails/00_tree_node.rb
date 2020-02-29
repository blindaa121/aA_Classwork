require 'byebug'
require_relative "queue"

class PolyTreeNode

    attr_reader :value, :parent, :children

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(node_inst)
        if @parent != nil
        #    i =  parent.children.index(self)
        #     parent.children.delete_at(i)
            @parent.children.delete(self)
            # self == b 
            # parent == a
            # assign self.parent = k
            # delete ourself out of the instance of a.children array
        end    
            if node_inst.nil?
                @parent = node_inst
            else 
                @parent = node_inst
                if !node_inst.children.include?(self)
                    node_inst.children << self
                end
            end
    end

    def add_child(child_node)
        # child_node.parent=(self)
        child_node.parent = self
        # k == our parent
        # b == self
        # we want add a child <d> to ourselves
            # <d>.add_parent = b
    end

    def remove_child(child_node)
        # cut off branch via one of our children's nodes
        if child_node.parent == nil
            raise "this node is not a child"
        end
        child_node.parent = nil
    end

    def inspect
        "<node: #{self.value}>"
    end

    def dfs(target_val) #self == b
    #   regular meth  dfs(root, target)
    #   class meth    b.dfs(target)
        return nil if self == nil
        return self if @value == target_val  #return self if target == b
                                                #target = f
        @children.each do |child_node|          #[c, d]   
            # debugger
            search_result = child_node.dfs(target_val)
            return search_result unless search_result.nil?
        end
        nil  #<= this returns nil if all children(recursed) have been searched and target not found
    end

    def bfs(target) # assume 'f' is target
        debugger
        queue = MyQueue.new
        queue.enqueue(self)
        until queue.empty?
            node = queue.dequeue
            return node if node.value == target
            node.children.each do |child|
                queue.enqueue(child)
            end
        end # queue over time == [a] => [b,c] => [f,e,c] => [h,g,f,e]
        nil
    end

end