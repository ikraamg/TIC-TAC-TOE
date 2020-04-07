#require_relative './modules.rb'

class Game
  attr_reader :board
  attr_reader :names

  def initialize
    @board = create_board
  end

  def player_names
    @player1 = Player.new(ask('Enter player 1 name:'))
    temp_name = ask('Enter player 2 name:')
    while temp_name == @player1.name
      temp_name = ask("This is the same as player one's name (#{@player1.name}), please enter another name:")
    end
    @player2 = Player.new(temp_name)
    @names = [@player1.name, @player2.name] * 5
  end

  def greeting
    show_board_hint(@board)
    player_names
  end

  def create_board
    Array.new(9, 0)
  end
end
