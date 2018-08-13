require_relative "token.rb"
require_relative "game.rb"

class Board
  def initialize
    # Add White team tokens
    Rook.new("W",0,0)
    Rook.new("W",0,7)
    Knight.new("W",0,1)
    Knight.new("W",0,6)
    Bishop.new("W",0,2)
    Bishop.new("W",0,5)
    Queen.new("W",0,3)
    King.new("W",0,4)
    8.times { |i| Pawn.new("W",1,i) }

    # And Black team tokens
    Rook.new("B",7,0)
    Rook.new("B",7,7)
    Knight.new("B",7,1)
    Knight.new("B",7,6)
    Bishop.new("B",7,2)
    Bishop.new("B",7,5)
    Queen.new("B",7,3)
    King.new("B",7,4)
    8.times { |i| Pawn.new("B",6,i) }
		
	end

	# Searches for token at a selected square. Prints its icon if one exists, if not prints blank.
	def render_token(x,y)
  	token =  Token.class_variable_get(:@@tokens).detect { |token| token.location === [x,y]}
  	token === nil ? (return " ") : (return token.icon)
  end

	def render_board
    puts %{
      A   B   C   D   E   F   G   H
    +---+---+---+---+---+---+---+---+
  1 | #{render_token(0,0)} | #{render_token(0,1)} | #{render_token(0,2)} | #{render_token(0,3)} | #{render_token(0,4)} | #{render_token(0,5)} | #{render_token(0,6)} | #{render_token(0,7)} |
    +---+---+---+---+---+---+---+---+
  2 | #{render_token(1,0)} | #{render_token(1,1)} | #{render_token(1,2)} | #{render_token(1,3)} | #{render_token(1,4)} | #{render_token(1,5)} | #{render_token(1,6)} | #{render_token(1,7)} | 
    +---+---+---+---+---+---+---+---+
  3 | #{render_token(2,0)} | #{render_token(2,1)} | #{render_token(2,2)} | #{render_token(2,3)} | #{render_token(2,4)} | #{render_token(2,5)} | #{render_token(2,6)} | #{render_token(2,7)} |
    +---+---+---+---+---+---+---+---+
  4 | #{render_token(3,0)} | #{render_token(3,1)} | #{render_token(3,2)} | #{render_token(3,3)} | #{render_token(3,4)} | #{render_token(3,5)} | #{render_token(3,6)} | #{render_token(3,7)} |
    +---+---+---+---+---+---+---+---+
  5 | #{render_token(4,0)} | #{render_token(4,1)} | #{render_token(4,2)} | #{render_token(4,3)} | #{render_token(4,4)} | #{render_token(4,5)} | #{render_token(4,6)} | #{render_token(4,7)} |
    +---+---+---+---+---+---+---+---+
  6 | #{render_token(5,0)} | #{render_token(5,1)} | #{render_token(5,2)} | #{render_token(5,3)} | #{render_token(5,4)} | #{render_token(5,5)} | #{render_token(5,6)} | #{render_token(5,7)} |
    +---+---+---+---+---+---+---+---+
  7 | #{render_token(6,0)} | #{render_token(6,1)} | #{render_token(6,2)} | #{render_token(6,3)} | #{render_token(6,4)} | #{render_token(6,5)} | #{render_token(6,6)} | #{render_token(6,7)} |
    +---+---+---+---+---+---+---+---+
  8 | #{render_token(7,0)} | #{render_token(7,1)} | #{render_token(7,2)} | #{render_token(7,3)} | #{render_token(7,4)} | #{render_token(7,5)} | #{render_token(7,6)} | #{render_token(7,7)} |
    +---+---+---+---+---+---+---+---+
    }
  end
end