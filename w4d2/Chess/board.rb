require_relative "piece"

class Board
  include Singleton

  def initialize
    @board = Array.new(8) { Array.new (8, nil) } #NullPiece.new) }
  end

  def print
    @board.each do |row|
      puts row
    end
  end

  def [](pos)
    x,y = pos
    @board[x][y]
  end

  def []=(pos, val)
    x,y = pos
    @board[x][y] = val
  end

  def move_piece(color, start_pos, end_pos)
    # if @board[start_pos].empty? || !@board[end_pos].empty?
    #   raise 
  end

  def valid_pos?(pos)
    return false if !(0...board.length).include?(pos[0]) || !(0...board.length).include?(pos[1])
    true
  end

  # def add_piece(piece, pos)

  # end

  # def checkmate?(color)

  # end

  # def in_check?(color)

  # end

  # def find_king(color)

  # end

  # def pieces

  # end

  # def dup

  # end

  # def move_piece!(color, start_pos, end_pos)

  # end


end