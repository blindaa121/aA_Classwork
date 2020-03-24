require_relative "queue"
require_relative "tree_node"

class KnightPathFinder

    attr_reader :considered_positions

    def self.valid_moves(curr_pos)
        # find 8 possible moves from passed in pos
        result = []
        directions = [[-2,-1],[-2,1],[2,-1],[2,1],[1,2],[1,-2],[-1,2],[-1,-2]]
            # max range: [0,0], [7,7]
        directions.each do |move|
            x, y = move
            a, b = curr_pos
            if (0..7).to_a.include?(x+a) && (0..7).to_a.include?(y+b)
                result << move
            end
        end
        result
    end

    def initialize(pos_arr)
        @root_node = PolyTreeNode.new(pos_arr) #knight's initial position
        @considered_positions = [pos_arr]
        # build_move_tree
    end

    def new_move_positions(curr_pos)
        valid_opt = KnightPathFinder.valid_moves(curr_pos)
        # filter position in @considered_psoitions
        selected_pos = valid_opt.select { |pos| !@considered_positions.include?(pos) }
        # add new positions to @considered_positions
        @considered_positions.concat(selected_pos)
        #return new positions
        selected_pos
    end

    def build_move_tree
        queue = [@root_node]
        while !queue.empty?
            curr_node = queue.shift # take the first node
            new_positions = new_move_positions(curr_node.value)  #Find valid moves/ aka our children
            new_positions.each do |pos|  #iterate through children (not created yet)
                new_node = PolyTreeNode.new(pos)        #create each child
                curr_node.add_child(new_node)   #Add     #assign each child to our children's array
                queue.push(new_node)                     #add each child to the queue to find its children
            end
        end 
        @root_node
    end
end
