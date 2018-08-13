require_relative "board.rb"
require_relative "token.rb"

class Game

  def initialize
    board = Board.new
    board.render_board
  end

end