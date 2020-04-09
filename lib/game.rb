class Game
  attr_reader :board
  attr_reader :names

  def initialize(player1, player2)
    @board = create_board
    @names = [player1, player2] * 5
  end

  def greeting
    show_board_hint(@board)
  end
  
  private

  def create_board
    Array.new(9, 0)
  end
end
