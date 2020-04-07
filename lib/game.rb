require_relative './modules.rb'

class Game
  include QuestionMaker
  include Visualizer
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

  def play
    greeting
    dialog
    turn = 0
    until check_game
      show_board(@board)
      move = question(turn)
      redo if check_spot(move, turn) == 'jump_next'
      turn += 1
    end
    end_message
  end

  private

  def dialog
    dialog_text = @player1.talk_with(@player2)
    (dialog_text.size / 2).times do |i|
      print_for_me "#{@player1.name}: "
      print_for_me " #{slow_typing(dialog_text[i * 2], 1)}\n"
      print_for_me "#{@player2.name}: "
      print_for_me " #{slow_typing(dialog_text[i * 2 + 1], 1)}\n"
      slow_typing('...', 20)
    end
  end

  def greeting
    show_board_hint(@board)
    puts_for_me "Welcome to #{@name} game..."
    player_names
  end

  def create_board
    Array.new(9, 0)
  end
end
