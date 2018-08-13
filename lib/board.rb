class Token
	attr_accessor :team, :location
	@@token_list = []

	def initialize(team,x,y)
		@team = team
		@location = [x,y]
		@previous_locations = nil
		@@token_list << self
	end
end

class Rook < Token
	attr_accessor :icon

	def initialize(team,x,y)
		super(team, x,y)
		@icon = "\u2656"
	end
end

class Knight < Token
	attr_accessor :icon

	def initialize(team,x,y)
		super(team,x,y)
		@icon = "\u2658"
	end
end

class Board
	def initialize
		@board_map = Array.new(9)
	end

	# Searches for token at a selected square. Prints its icon if one exists, if not prints blank.
	def render_token(x,y)
  	token =  Token.class_variable_get(:@@token_list).select {|token| token.location === [x,y]}
  	token[0] != nil ? (return token[0].icon) : (return " ")
  end

	def render_board
    puts %{
      A   B   C
    +-----------+
  1 | #{render_token(0,0)} | #{render_token(0,1)} | #{render_token(0,2)} |
    +-----------+
  2 | #{render_token(1,0)} | #{render_token(1,1)} | #{render_token(1,2)} |
    +-----------+
  3 |   |   |   |
    +-----------+
    }
  end
end

board = Board.new

rook = Rook.new("white",1,0)
knight = Knight.new("white",0,1)

board.render_board