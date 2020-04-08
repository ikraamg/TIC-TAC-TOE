#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/tictactoe.rb'

def slow_typing(text, speed)
  text.size.times do |i|
    print text[i]
    sleep speed * 0.01
  end
  puts
end
BOARD_CYPHER = { "0": ' . ', "1": ' X ', '10': ' O ' }.freeze
def show_board(board)
  board_show = board.clone
  board_show.map! do |item|
    BOARD_CYPHER[item.to_s.to_sym]
  end
  draw_grid(board_show)
end

def show_board_hint(board)
  hint_board = board.clone
  hint_board.map! do |item|
    if item.zero?
      "(#{hint_board.index(item) + 1})"
    else
      BOARD_CYPHER[item.to_s.to_sym]
    end
  end
  draw_grid(hint_board)
end

def draw_grid(array)
  hypens = '-------------------'
  hypens_w_nl = "-------------------\n"
  puts "\n  " + hypens
  3.times do |i|
    print '  | '
    print array[i * 3]
    print ' | '
    print array[i * 3 + 1]
    print ' | '
    print array[i * 3 + 2]
    print " |\n  #{hypens_w_nl if i < 2}"
  end
  puts hypens
end

def ask(text)
  puts text
  gets.chomp!
end

def turn_sign(turn)
  turn.even? ? 'X' : 'O'
end

def question(turn, class_instance)
  text = "Make your move #{class_instance.names[turn]} (#{turn_sign(turn)}) (1..9):"
  slow_typing(text, 1)
end

def answer_check
  loop do
    answer = gets.chomp!.to_i
    return answer if (1..9).include? answer

    puts 'Please enter a number between 1 and 9...'
  end
end

def end_message(class_instance)
  puts '______________________'
  puts 'game over'.upcase
  show_board(class_instance.board)
  puts class_instance.win_message
  puts '______________________'
end

def check_name(name, default_name)
  name == '' ? default_name : name
end

def player_names
  player1 = ask('Enter player 1 name:')
  player1 = check_name(player1, 'Kubilay')
  temp_name = ask('Enter player 2 name:')
  player2 = check_name_equality(player1, temp_name)
  player2 = check_name(player2, 'Ikraam')
  [player1, player2]
end

def check_name_equality(player1, temp_name)
  while temp_name == player1
    temp_name = ask("This is the same as player one's name (#{player1}), please enter another name:")
  end
  temp_name
end

names = player_names
new_game = TicTacToe.new(names[0], names[1])
puts new_game
new_game.greeting
turn = 0
until new_game.check_game
  show_board(new_game.board)
  question(turn, new_game)
  move = answer_check
  if new_game.check_spot(move, turn) == 'jump_next'
    text = "Please make another move. That (#{move}) place is already taken!"
    slow_typing(text, 0.5)
    show_board_hint(new_game.board)
    redo
  else
    turn += 1
  end
end
end_message(new_game)
