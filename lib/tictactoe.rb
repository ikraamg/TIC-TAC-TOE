require_relative 'game.rb'

class TicTacToe < Game
  def initialize
    super
    @name = 'Tic Tac Toe'
  end

  def to_s
    'This is a TIC TAC TOE game!'
  end

  private

  def check_spot(move, turn)
    if @board[move - 1].zero?
      make_move(move, turn)
    else
      text = "Please make another move. That (#{move}) place is already taken!"
      slow_typing(text, 0.5)
      show_board_hint(@board)
      'jump_next'
    end
  end

  def calculate_board
    sum_of_lines = []
    sum_of_lines = calculate_linear(sum_of_lines)
    calculte_diagonal(sum_of_lines)
  end

  def calculate_linear(array)
    3.times do |i|
      sum_line = @board[i * 3] + @board[i * 3 + 1] + @board[i * 3 + 2]
      array << sum_line
      sum_line = @board[i] + @board[i + 3] + @board[i + 6]
      array << sum_line
    end
    array
  end

  def calculte_diagonal(array)
    2.times do |i|
      sum_diagonal = @board[i + i] + @board[4] + @board[8 - i * 2]
      array << sum_diagonal
    end
    array
  end

  def make_move(move, turn)
    mark = turn.even? ? 1 : 10
    @board[move - 1] = mark
  end

  def check_game
    return true if calculate_board.include?(30)
    return true if calculate_board.include?(3)
    return true unless @board.include?(0)

    false
  end

  def end_message
    puts_for_me '______________________'
    puts_for_me 'game over'.upcase
    show_board(@board)
    puts_for_me win_message
    puts_for_me '______________________'
  end

  def win_message
    return "#{@names[0]} WINS!" if calculate_board.include?(3)
    return "#{@names[1]} WINS!" if calculate_board.max == 30

    "That's a draw!".upcase
  end
end