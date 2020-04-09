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
  let(:x_wins) { [1, 1, 1, 0, 0, 0, 0, 0, 0] }
  let(:y_wins) { [10, 10, 10, 0, 0, 0, 0, 0, 0] }
  let(:draw) { [1, 1, 10, 10, 10, 1, 1, 10, 1] }
  start_game = TicTacToe.new('Ikraam', 'Kubilay')
  describe '#initialize' do
    it 'Returns an ' do
      expect { TicTacToe.new('Ikraam', 'Kubilay') }.not_to raise_error
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
    it 'it runs make move method if the spot is 0' do
      expect(start_game.check_spot(1, 1)).to eq('moved')
    end
    it 'returns a string when the spot is already occupied' do
      expect(start_game.check_spot(1, 1)).to eq('jump_next')
    end
  end
  describe '#check_game' do
    it 'returns true if the X wins' do
      start_game.board = x_wins
      expect(start_game.check_game).to be true
    end
    it 'returns true if the Y wins' do
      start_game.board = y_wins
      expect(start_game.check_game).to be true
    end
    it 'returns true if it is a draw' do
      start_game.board = draw
      expect(start_game.check_game).to be true
    end
    it "doesn't return true if the game is goin on" do
      start_game.board = [1, 10, 0, 0, 0, 0, 0, 0, 0]
      expect(start_game.check_game).not_to be true
    end
  end

  describe '#win_message' do
    it 'returns a string when X wins' do
      start_game.board = x_wins
      expect(start_game.win_message).to eq("#{start_game.names[0]} WINS!")
    end

    it 'returns a string when Y wins' do
      start_game.board = y_wins
      expect(start_game.win_message).to eq("#{start_game.names[1]} WINS!")
    end

    it 'returns a string when game is a draw' do
      start_game.board = draw
      expect(start_game.win_message).to eq("THAT'S A DRAW!")
    end
  end
end

describe Player do
  new_player = Player.new('Ikraam')
  player2 = Player.new('Kubilay')
  describe '#initialize' do
    it 'Returns an ' do
      expect { Player.new('Ikraam') }.not_to raise_error
    end
  end
  describe '#talk_with' do
    it 'Returns an array of speech' do
      speech = [
        "Hello, I am #{new_player.name}",
        "Hi! I am #{player2.name} nice to meet you!",
        'Oh yesterday the weather was awesome!',
        'Omg yes! That was great!',
        "Do you know about this game called TicTacToe #{player2.name}?",
        "Oh yes I've heard about it let's play!!!"
      ]
      expect(new_player.talk_with(player2)).to eq(speech)
    end
  end
end

describe '#turn_sign' do
  it 'returns X when even integer passed' do
    expect(turn_sign(2)).to eq('X')
  end
  it 'returns O when even integer passed' do
    expect(turn_sign(1)).to eq('O')
  end
end

describe '#check_name' do
  let(:empty_string) { '' }
  let(:name1) { 'Kubilay' }
  it 'returns default name' do
    expect(check_name(empty_string, 'Kubilay1')).to eq('Kubilay1')
  end
  it 'returns name' do
    expect(check_name(name1, 'Kubilay')).to eq('Kubilay')
  end
end
