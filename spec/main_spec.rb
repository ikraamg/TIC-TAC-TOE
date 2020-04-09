require_relative '../bin/main.rb'

describe Game do
  player = Game.new("Ikraam", "Kubilay")
  describe '#initialize' do
    it 'Reurns an array with two inputs and 5 times' do
      expect(player.names).to eq(["Ikraam", "Kubilay"] * 5)
    end
  end
  describe '#board' do
    it 'returns an array with 9 integers as 0 or 1 or 10' do

    end
  end
end



tictactoe = TicTacToe.new("Ikraam", "Kubilay")
print tictactoe.methods.sort - Object.methods
puts
player = Player.new("Kubilay")
print player.methods.sort - Object.methods