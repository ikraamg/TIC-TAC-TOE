require_relative '../bin/main.rb'

describe Game do
  player = Game.new('Ikraam', 'Kubilay')
  describe '#initialize' do
    it 'Reurns an ' do
      expect { Game.new('Ikraam', 'Kubilay') }.not_to raise_error(ArgumentError)
    end
  end
  describe '#names' do
    it 'Reurns an array with two inputs and 5 times' do
      expect(player.names).to eq(%w[Ikraam Kubilay] * 5)
    end
  end
  describe '#board' do
    it 'returns an array with 9 integers of 0' do
      expect(player.board).to eq(Array.new(9, 0))
    end
  end
  describe '#greeting' do
    it 'returns the same as player.board passed to show_board_hint' do
      expect(player.greeting).to eq(show_board_hint(player.board))
    end
  end
end

describe TicTacToe do
  start_game = TicTacToe.new('Ikraam', 'Kubilay')
  describe '#initialize' do
    it 'Reurns an ' do
      expect { TicTacToe.new('Ikraam', 'Kubilay') }.not_to raise_error(ArgumentError)
    end
  end
  describe '#names' do
    it 'Reurns an array with two inputs and 5 times' do
      expect(start_game.names).to eq(%w[Ikraam Kubilay] * 5)
    end
  end
  describe '#board' do
    it 'returns an array with 9 integers of 0' do
      expect(start_game.board).to eq(Array.new(9, 0))
    end
  end
  describe '#greeting' do
    it 'returns the same as start_game.board passed to show_board_hint' do
      expect(start_game.greeting).to eq(show_board_hint(start_game.board))
    end
  end
  describe '#to_s' do
    it 'returns correct string' do
      expect(start_game.to_s).to eq("Welcome\nThis is a TIC TAC TOE game!")
    end
  end
  describe '#check-spot' do
    it 'returns a string when the spot is already occupied' do
      expect start_game.check_spot(1, 1).to eq('jump_next')
    end
  end
end

tictactoe = TicTacToe.new('Ikraam', 'Kubilay')
print tictactoe.methods.sort - Object.methods
puts
player = Player.new('Kubilay')
print player.methods.sort - Object.methods
