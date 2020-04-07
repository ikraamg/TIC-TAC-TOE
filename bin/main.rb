#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/tictactoe.rb'

module Visualizer
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
end

module QuestionMaker
  def ask(text)
    puts text
    gets.chomp!
  end

  def question(turn, class_instance)
    turn_sign = turn.even? ? 'X' : 'O'
    text = "Make your move #{class_instance.names[turn]} (#{turn_sign}) (1..9):"
    slow_typing(text, 1)
    loop do
      answer = gets.chomp!.to_i
      return answer if (1..9).include? answer

      puts 'Please enter a number between 1 and 9...'
    end
  end
end

def dialog
  dialog_text = @player1.talk_with(@player2)
  (dialog_text.size / 2).times do |i|
    "#{@player1.name}: "
    " #{slow_typing(dialog_text[i * 2], 1)}\n"
    "#{@player2.name}: "
    " #{slow_typing(dialog_text[i * 2 + 1], 1)}\n"
    slow_typing('...', 20)
  end
end

include Visualizer
include QuestionMaker

def end_message(class_instance)
  puts '______________________'
  puts 'game over'.upcase
  class_instance.show_board(class_instance.board)
  puts class_instance.win_message
  puts '______________________'
end

def play
  new_game = TicTacToe.new
  new_game.greeting
  turn = 0
  until new_game.check_game
    new_game.show_board(new_game.board)
    move = question(turn, new_game)
    redo if new_game.check_spot(move, turn) == 'jump_next'
    turn += 1
  end
  end_message(new_game)
end

play
