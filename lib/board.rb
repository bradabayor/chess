require_relative "token.rb"
require_relative "game.rb"

class Board
  def initialize
    # Initialize board map
    @bm = Array.new(8){Array.new(8, " ")}

    # Add White team tokens
    Rook.new("W",7,0)
    Rook.new("W",7,7)
    Knight.new("W",7,1)
    Knight.new("W",7,6)
    Bishop.new("W",7,2)
    Bishop.new("W",7,5)
    Queen.new("W",7,3)
    King.new("W",7,4)
    8.times { |i| Pawn.new("W",6,i) }

    # And Black team tokens
    Rook.new("B",0,0)
    Rook.new("B",0,7)
    Knight.new("B",0,1)
    Knight.new("B",0,6)
    Bishop.new("B",0,2)
    Bishop.new("B",0,5)
    Queen.new("B",0,3)
    King.new("B",0,4)
    8.times { |i| Pawn.new("B",1,i) }
		
  end
  
  def plot_selected_token_moves

  end

  def render_current_tokens
    Token.class_variable_get(:@@tokens).each do |token|
      y = token.location[0]
      x = token.location[1]
      @bm[y][x] = token.icon
    end
  end

  def render
    render_current_tokens

    puts %{
      A   B   C   D   E   F   G   H
    +---+---+---+---+---+---+---+---+
  1 | #{@bm[0][0]} | #{@bm[0][1]} | #{@bm[0][2]} | #{@bm[0][3]} | #{@bm[0][4]} | #{@bm[0][5]} | #{@bm[0][6]} | #{@bm[0][7]} |
    +---+---+---+---+---+---+---+---+
  2 | #{@bm[1][0]} | #{@bm[1][1]} | #{@bm[1][2]} | #{@bm[1][3]} | #{@bm[1][4]} | #{@bm[1][5]} | #{@bm[1][6]} | #{@bm[1][7]} |
    +---+---+---+---+---+---+---+---+
  3 | #{@bm[2][0]} | #{@bm[2][1]} | #{@bm[2][2]} | #{@bm[2][3]} | #{@bm[2][4]} | #{@bm[2][5]} | #{@bm[2][6]} | #{@bm[2][7]} |
    +---+---+---+---+---+---+---+---+
  4 | #{@bm[3][0]} | #{@bm[3][1]} | #{@bm[3][2]} | #{@bm[3][3]} | #{@bm[3][4]} | #{@bm[3][5]} | #{@bm[3][6]} | #{@bm[3][7]} |
    +---+---+---+---+---+---+---+---+
  5 | #{@bm[4][0]} | #{@bm[4][1]} | #{@bm[4][2]} | #{@bm[4][3]} | #{@bm[4][4]} | #{@bm[4][5]} | #{@bm[4][6]} | #{@bm[4][7]} |
    +---+---+---+---+---+---+---+---+
  6 | #{@bm[5][0]} | #{@bm[5][1]} | #{@bm[5][2]} | #{@bm[5][3]} | #{@bm[5][4]} | #{@bm[5][5]} | #{@bm[5][6]} | #{@bm[5][7]} |
    +---+---+---+---+---+---+---+---+
  7 | #{@bm[6][0]} | #{@bm[6][1]} | #{@bm[6][2]} | #{@bm[6][3]} | #{@bm[6][4]} | #{@bm[6][5]} | #{@bm[6][6]} | #{@bm[6][7]} |
    +---+---+---+---+---+---+---+---+
  8 | #{@bm[7][0]} | #{@bm[7][1]} | #{@bm[7][2]} | #{@bm[7][3]} | #{@bm[7][4]} | #{@bm[7][5]} | #{@bm[7][6]} | #{@bm[7][7]} |
    +---+---+---+---+---+---+---+---+
    }
  end

end