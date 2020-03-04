require_relative "display"
require_relative "player"
require_relative "board"

class Game
  PLAYERS = [:WHITE, :BLACK]

  def initialize
    @board = Board
    @display = Display.new
    @players = {player_1: PLAYERS[0], player_2: PLAYERS[1]}
    @current_player = :player_1
  end

  def play

  end

end