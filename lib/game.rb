require_relative "board.rb"
require_relative "token.rb"

class Game

  def initialize
    board = Board.new
    board.render_board

    print "Select Token: "
    selection = translate_input(gets.chomp)

    p selected_token =  Token.class_variable_get(:@@tokens).detect { |token| token.location === selection}
    p selected_token.find_possible_moves
  end

  def translate_input(input)
    return [(input[1].to_i - 1),(input[0].ord.to_i - 97)]
  end

end