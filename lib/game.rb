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
    9.times do |turn|
      show_board(@board)
      move = question(turn)
      redo if check_spot(move, turn) == 'jump_next'
      break if check_game == true
    end
    end_message
  end

  def auto_play(scenario)
    greeting
    9.times do |turn|
      show_board(@board)
      puts move = scenario[turn]
      sleep 1
      redo if check_spot(move, turn) == 'jump_next'
      break if check_game == true
    end
    end_message
  end

  private

  def dialog
    dialog_text = @player1.talk_with(@player2)
    (dialog_text.size / 2).times do |i|
      print "#{@player1.name}: "
      print " #{slow_typing(dialog_text[i * 2], 1)}\n"
      print "#{@player2.name}: "
      print " #{slow_typing(dialog_text[i * 2 + 1], 1)}\n"
      slow_typing('...', 20)
    end
  end

  def greeting
    show_board_hint(@board)
    puts "Welcome to #{@name} game..."
    player_names
  end

  def create_board
    Array.new(9, 0)
  end
end
