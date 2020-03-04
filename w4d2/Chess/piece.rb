class Piece
  include Singleton
  
  def initialize(color, board, board_pos)
    @color = color
    @board = board
  end

  def to_s(symbol)
    symbol.to_s
  end

  def empty?

  end

end

class NullPiece < Piece

  def initialize(color, board, board_pos)
    super(color, board, board_pos)
    @moves = []
  end

end

module Singleton

end

class Pawn < Piece
  super(color, board, board_pos)
  @move_dirs = []

  private 
  def at_start_row?
    #return the position at the start row?
  end

  def forward_dir()
     #returns 1 or -1
  end

  def forward_steps

  end

  def side_attacks

  end
  
end