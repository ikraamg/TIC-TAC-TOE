#!/usr/bin/env ruby
# frozen_string_literal: true

puts 'Hello!'

def greeting
  puts "Welcome to TicTacToe game!"
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

puts "Hello!"