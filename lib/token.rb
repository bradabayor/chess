class Token
  attr_accessor :location, :tokens
  attr_reader :team

  @@tokens = []

	def initialize(team,x,y)
		@team = team
		@location = [x,y]
    @previous_locations = nil
    @@tokens << self
	end
end

class Pawn < Token
	attr_reader :icon

	def initialize(team,x,y)
		super(team,x,y)
		team == "W" ? @icon = "\u2659" : @icon = "\u265F"
	end
end

class Rook < Token
	attr_reader :icon

	def initialize(team,x,y)
		super(team,x,y)
		team == "W" ? @icon = "\u2656" : @icon = "\u265C"
	end
end

class Knight < Token
	attr_reader :icon

	def initialize(team,x,y)
		super(team,x,y)
		team == "W" ? @icon = "\u2658" : @icon = "\u265E"
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