#!/usr/bin/env ruby
# frozen_string_literal: true

def greeting
  puts 'Welcome to TicTacToe game!'
end

def create_board
  Array.new(9, 0)
end

BOARD_CYPHER = { "0": ' . ', "1": ' X ', '10': ' O ' }.freeze

def show_board(board)
  board_show = board.clone
  board_show.map! do |item|
    BOARD_CYPHER[item.to_s.to_sym]
  end
  draw_grid(board_show)
end

def draw_grid(array)
  hypens = '-------------------'
  hypens_w_nl = "-------------------\n"
  puts "\n  " + hypens
  3.times do |i|
    print '  | ', array[i * 3], ' | ', array[i * 3 + 1], ' | ', array[i * 3 + 2], " |\n  #{if i < 2
                                                                                             hypens_w_nl
                                                                                           end}"
  end
  puts hypens
end

def slow_typing(text, speed)
  text.size.times do |i|
    print text[i]
    sleep speed * 0.01
  end
  puts
end

def question(turn)
  turn = turn.even? ? 'X' : 'O'
  text = "Now it is your turn #{turn}. Make your move! (1..9):"
  slow_typing(text, 1)
  loop do
    answer = gets.chomp!.to_i
    return answer if (1..9).include? answer

    puts 'Please enter a number between 1 and 9...'
  end
end

def play
  greeting

  board = create_board

  show_board(board)

  9.times do |turn|
    question(turn)
  end
end

play
