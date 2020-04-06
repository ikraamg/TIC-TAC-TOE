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


puts "Hello!"