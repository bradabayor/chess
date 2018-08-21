require_relative "helper.rb"
# Parent class for creating Chess peices. 
# Individual peice child classes inherit from Token, e.g. Rook < Token
class Token
  attr_accessor :location, :tokens
  attr_reader :team

	# Creates empty array that contains all present game Tokens irrespective of status.
  @@tokens = []

	def initialize(team,x,y)
		@team = team
		@location = [x,y]
		@possible_moves = []
		@move_offsets = []
		@taken = false
    @@tokens << self
	end

	def find_possible_moves
		combined_axes = []
		@final_positions = []

		switch_move_direction unless @team == "W"

		generate_moves

		i = 0
		while i < @move_offsets.size do
			combined_axes = @move_offsets[i].zip(@location)
			@final_positions << combined_axes.map { |axes_pair| axes_pair.reduce { |axes_sum,axes| axes_sum + axes} } 
			i += 1
		end
		p @final_positions
	end

	# Switch Offsets Dependent on Token Travel Direction
	def switch_move_direction
		@move_offsets.each do |move|
			move[0] = move[0]*-1
		end
	end
end

class Pawn < Token
	attr_reader :icon
 
	def initialize(team,x,y)
		super(team,x,y)
		team == "W" ? @icon = "\u2659" : @icon = "\u265F"
		
		# Add Token-Specific Possible Move Parameters -> Forward 1||Forward 2 if @ Start||Diag if Enemy
		@move_offsets << [-1,0]
		@move_offsets << [-2,0] if self.location[0] == 1 || 6
	end
end

class Rook < Token
	attr_reader :icon

	def initialize(team,x,y)
		super(team,x,y)
		@possible_moves = []
		team == "W" ? @icon = "\u2656" : @icon = "\u265C"
		end

	#Add Rook-Specific Possible Move Parameters -> Horiz||Vert Unrestrained to Board Edge
	def generate_moves
		x = (7 - self.location[1])
		until x >= 8
			@final_positions << [self.location[0],x]
			x += 1
		end

		x = (0 + self.location[1] - 1)
		until x <= -1
			@final_positions << [self.location[0],x]
			x -= 1
		end

		y = (7 - self.location[0])
		until y >= 8
			@final_positions << [y,self.location[1]]
			y += 1
		end

		y = (0 + self.location[0] - 1)
		until y <= -1
			@final_positions << [y,self.location[1]]
			y -= 1
		end
	end
end

class Knight < Token
	attr_reader :icon

	def initialize(team,x,y)
		super(team,x,y)
		team == "W" ? @icon = "\u2658" : @icon = "\u265E"
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
		@final_positions.extract do |move|
			(move[0] >= 0 && 7 >= move[0]) && (move[1] >= 0 && 7 >= move[1]) 
		end
	end
end

class Bishop < Token
	attr_reader :icon

	def initialize(team,x,y)
		super(team,x,y)
		team == "W" ? @icon = "\u2657" : @icon = "\u265D"
	end
end

class Queen < Token
	attr_reader :icon

	def initialize(team,x,y)
		super(team,x,y)
		team == "W" ? @icon = "\u2655" : @icon = "\u265B"
	end
end

class King < Token
	attr_reader :icon

	def initialize(team,x,y)
		super(team,x,y)
		team == "W" ? @icon = "\u2654" : @icon = "\u265A"
	end
end