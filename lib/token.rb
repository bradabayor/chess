require_relative "helper.rb"
# Parent class for creating Chess peices. 
# Individual peice child classes inherit from Token, e.g. Rook < Token
class Token
  attr_accessor :location, :tokens
  attr_reader :team

	# Creates empty array that contains all present game Tokens irrespective of status.
  @@tokens = []

	def initialize(team, x, y)
		@team = team
		@location = [x,y]
		@final_positions = []
		@taken = false
    @@tokens << self
	end

	# Generates diagonal moves in a goven direction, and adds to instance @final_positions array
	def generate_linear_moves(offset_y, offset_x, extent=nil)
		y = self.location[0]
		x = self.location[1]

		extent_y = 0
		extent_x = 0

		offset_y == 1 ? extent_y = 7 : extent_y = 0
		offset_x == 1 ? extent_x = 7 : extent_x = 0

		if extent != nil
			extent_y == 7 ? (extent_y = y + extent) : (extent_y = y - extent)
			extent_x == 7 ? (extent_x = x + extent) : (extent_x = x - extent)
		end

		until x == extent_x || y == extent_y do
				@final_positions << [y + offset_y, x + offset_x]
				y += offset_y
				x += offset_x
		end
		
		@final_positions
	end

	def assign_icon(white_icon, black_icon)
		@icon = if @team == 'W'
			white_icon
		else
			black_icon
		end
	end
end

class Pawn < Token
	attr_reader :icon
 
	def initialize(team, x, y)
		super(team,x,y)
		assign_icon("\u2659", "\u265F")
	end

	def generate_moves
		if self.team == "W"
			@final_positions << [self.location[0] - 1, self.location[1]]
			@final_positions << [self.location[0] - 2, self.location[1]] if self.location[0] == 6
		else
			@final_positions << [self.location[0] + 1, self.location[1]]
			@final_positions << [self.location[0] + 2, self.location[1]] if self.location[0] == 1
		end
		@final_positions
	end
end

class Rook < Token
	attr_reader :icon

	def initialize(team, x, y)
		super(team, x, y)
		assign_icon("\u2656", "\u265C")
		end

	#Add Rook-Specific Possible Move Parameters -> Horiz||Vert Unrestrained to Board Edge
	def generate_moves
		generate_linear_moves(1, 0)
		generate_linear_moves(-1, 0)
		generate_linear_moves(0, 1)
		generate_linear_moves(0, -1)
	end
end

class Knight < Token
	attr_reader :icon

	def initialize(team, x, y)
		super(team, x, y)
		assign_icon("\u2658", "\u265E")
	end

	def generate_moves
		@final_positions << [self.location[0] + 2,self.location[1] - 1]
		@final_positions << [self.location[0] + 2,self.location[1] + 1]
		@final_positions << [self.location[0] + 1,self.location[1] - 2]
		@final_positions << [self.location[0] + 1,self.location[1] + 2]
		@final_positions << [self.location[0] - 2,self.location[1] - 1]
		@final_positions << [self.location[0] - 2,self.location[1] + 1]
		@final_positions << [self.location[0] - 1,self.location[1] - 2]
		@final_positions << [self.location[0] - 1,self.location[1] + 2]
		@final_positions.keep do |move|
			move[0] >= 0 || 7 >= move[0] || move[1] >= 0 || 7 >= move[1]
		end
	end
end

class Bishop < Token
	attr_reader :icon

	def initialize(team, x, y)
		super(team, x, y)
		assign_icon("\u2657", "\u265D")
	end

	def generate_moves
		generate_linear_moves(1, 1)
		generate_linear_moves(1, -1)
		generate_linear_moves(-1, 1)
		generate_linear_moves(-1, -1)
	end
	
end

class Queen < Token
	attr_reader :icon

	def initialize(team, x, y)
		super(team, x, y)
		assign_icon("\u2655", "\u265B")
	end

	def generate_moves
		generate_linear_moves(1, 1)
		generate_linear_moves(1, -1)
		generate_linear_moves(-1, 1)
		generate_linear_moves(-1, -1)
		generate_linear_moves(1, 0)
		generate_linear_moves(-1, 0)
		generate_linear_moves(0, 1)
		generate_linear_moves(0, -1)
	end
end

class King < Token
	attr_reader :icon

	def initialize(team, x, y)
		super(team, x, y)
		assign_icon("\u2654", "\u265A")
	end

	def generate_moves
		generate_linear_moves(1, 1, 1)
		generate_linear_moves(1, -1, 1)
		generate_linear_moves(-1, 1, 1)
		generate_linear_moves(-1, -1, 1)
		generate_linear_moves(1, 0, 1)
		generate_linear_moves(-1, 0, 1)
		generate_linear_moves(0, 1, 1)
		generate_linear_moves(0, -1, 1)
	end
end
