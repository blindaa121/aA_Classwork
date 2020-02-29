class KnightPathFinder

    attr_reader :considered_positions

    def self.valid_moves(pos)
        !@considered_positions.include?(pos)
    end

    def initialize(pos_arr)
        @root_node = PolyTreeNode.new(new_arr) #knight's initial position
        @considered_positions = [pos_arr]
        self.build_move_tree
    end

    def build_move_tree

    end

    def new_move_positions(pos)
        if KnightPathFinder.valid_moves(pos)
            @considered_positions << pos
        end
        @considered_positions
    end
end
