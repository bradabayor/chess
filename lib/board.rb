require_relative "token.rb"

class Board
  attr_reader :bm

  def initialize
    @bm = Array.new(8){Array.new(8)}

    @bm[0][0] = Token.new("white","\u2656",[0][0])
    @bm[0][1] = Token.new("white","\u2658",[0][0])
    @bm[0][2] = Token.new("white","\u2657",[0][0])
    @bm[0][3] = Token.new("white","\u2654",[0][0])
    @bm[0][4] = Token.new("white","\u2655",[0][0])
    @bm[0][5] = Token.new("white","\u2657",[0][0])
    @bm[0][6] = Token.new("white","\u2658",[0][0])
    @bm[0][7] = Token.new("white","\u2656",[0][0])

    8.times do |i|
      @bm[1][i] = Token.new("white","\u2659",[0][0])
    end

  end


  def render_board
    puts %{
      A   B   D   C   E   F   G   H 
    +-------------------------------+
  1 | #{@bm[0][0].icon} | #{@bm[0][1].icon} | #{@bm[0][2].icon} | #{@bm[0][3].icon} | #{@bm[0][4].icon} | #{@bm[0][5].icon} | #{@bm[0][6].icon} | #{@bm[0][7].icon} |
    +-------------------------------+
  2 | #{@bm[1][0].icon} | #{@bm[1][1].icon} | #{@bm[1][2].icon} | #{@bm[1][3].icon} | #{@bm[1][4].icon} | #{@bm[1][5].icon} | #{@bm[1][6].icon} | #{@bm[1][7].icon} |
    +-------------------------------+
  3 |   |   |   |   |   |   |   |   |
    +-------------------------------+
  4 |   |   |   |   |   |   |   |   |
    +-------------------------------+
  5 |   |   |   |   |   |   |   |   |
    +-------------------------------+
  6 |   |   |   |   |   |   |   |   |
    +-------------------------------+
  7 |   |   |   |   |   |   |   |   |
    +-------------------------------+
  8 |   |   |   |   |   |   |   |   |
    +-------------------------------+
    }
  end

end

board = Board.new

board.render_board