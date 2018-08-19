require_relative "board.rb"
require_relative "token.rb"

class Game

  def initialize
    board = Board.new
    board.render_current_tokens
    board.render

    print "Select Token: "
    selection = translate_input(gets.chomp)

    selected_token =  Token.class_variable_get(:@@tokens).detect { |token| token.location === selection}

    puts "ST: #{selected_token.team} #{selected_token.class} @ #{selected_token.location}"

    board.plot_selected_token_moves(selected_token)

    board.render

    print "Select Move: "
    selected_move = translate_input(gets.chomp)

    board.move_token(selected_token,selected_move)

  end

  def translate_input(input)
    return [(input[1].to_i - 1),(input[0].ord.to_i - 97)]
  end

end