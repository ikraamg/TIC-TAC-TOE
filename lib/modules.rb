module Visualizer
  def slow_typing(text, speed)
    text.size.times do |i|
      print_for_me text[i]
      sleep speed * 0.01
    end
    puts_for_me
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
    puts_for_me "\n  " + hypens
    3.times do |i|
      print_for_me '  | '
      print_for_me array[i * 3]
      print_for_me ' | '
      print_for_me array[i * 3 + 1]
      print_for_me ' | '
      print_for_me array[i * 3 + 2]
      print_for_me " |\n  #{hypens_w_nl if i < 2}"
    end
    puts_for_me hypens
  end
end

module QuestionMaker
  def ask(text)
    puts_for_me text
    gets_for_me
  end

  def question(turn)
    turn_sign = turn.even? ? 'X' : 'O'
    text = "Make your move #{@names[turn]} (#{turn_sign}) (1..9):"
    slow_typing(text, 1)
    loop do
      answer = gets_for_me.to_i
      return answer if (1..9).include? answer

      puts_for_me 'Please enter a number between 1 and 9...'
    end
  end
end
