require_relative "humanplayer"
require_relative "computerplayer"

class Player

  def initialize(color, display)
    @color = color
    @display = display
  end

end

class HumanPlayer < Player

  super(color, display)

  def make_move()

  end

end

class ComputerPlayer < Player

  super(color, display)

  def make_move()

  end

end