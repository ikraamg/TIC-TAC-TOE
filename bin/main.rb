#!/usr/bin/env ruby

require_relative '../lib/player.rb'
require_relative '../lib/tictactoe.rb'

def print_for_me(item)
  print item
end

def puts_for_me(item = nil)
  puts item
end

def gets_for_me
  gets.chomp!
end

new_game = TicTacToe.new
new_game.play
