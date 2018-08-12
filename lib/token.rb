class Token
  attr_reader :icon

  def initialize(team,icon,start_location)
    @team = team
    @icon = icon
    @start_location = start_location
  end
end