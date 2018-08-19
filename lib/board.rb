require_relative "token.rb"
require_relative "game.rb"

class Board
  def initialize
    # Initialize board map hash
    keys = []
    8.times do |i|
      row = (97 + i).chr
      8.times do |i|
        keys << "#{row}#{i+1}"
      end
    end

    locations = []
    8.times do |i|
      row = i
      8.times do |i|
        locations << [row,i]
      end
    end

    keys = keys.map!(&:to_sym)

    @bm = Hash[keys.map{ |x| [x,{}] }]

    @bm.each_with_index do |(k,v),i|
      @bm.store(k,{})
      @bm[k].store(:location,locations[i])
      @bm[k].store(:display," ")
    end

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

    @token_list = Proc.new {Token.class_variable_get(:@@tokens)}
  end
  
  # Updates the @bm with the selected token possible moves,
  #  generated by Token.find_possible_moves.
  def plot_selected_token_moves(token)
    empty_squares = @bm.select { |k,v| v[:display] == " "}
    @final_positions = token.find_possible_moves
    @final_positions.each do |position|
      find_and_replace(position,"X")
    end
  end

  # Updates the @bm with all current tokens on the board in associated locations.
  def render_current_tokens
    @token_list.call.each do |token|
      find_and_replace(token.location,token.icon)
    end
  end

  # Updates the @bm by moving the selected token to the desired square.
  #  Removes move indicators and replaces the initial square with " ".
  def move_token(token,move)
    if @final_positions.any? { |position| position == move }
      find_and_replace(move,token.icon)
      token.location = move
    end
    render
  end

  def find_and_replace(desired_location,desired_display)
    new_location = @bm.find { |sq| sq[1][:location] == desired_location }
    new_location[1][:display] = desired_display unless desired_display === nil
  end

  def render
    puts %{
      A   B   C   D   E   F   G   H
    +---+---+---+---+---+---+---+---+
  1 | #{@bm[:a1][:display]} | #{@bm[:a2][:display]} | #{@bm[:a3][:display]} | #{@bm[:a4][:display]} | #{@bm[:a5][:display]} | #{@bm[:a6][:display]} | #{@bm[:a7][:display]} | #{@bm[:a8][:display]} |
    +---+---+---+---+---+---+---+---+
  2 | #{@bm[:b1][:display]} | #{@bm[:b2][:display]} | #{@bm[:b3][:display]} | #{@bm[:b4][:display]} | #{@bm[:b5][:display]} | #{@bm[:b6][:display]} | #{@bm[:b7][:display]} | #{@bm[:b8][:display]} |
    +---+---+---+---+---+---+---+---+
  3 | #{@bm[:c1][:display]} | #{@bm[:c2][:display]} | #{@bm[:c3][:display]} | #{@bm[:c4][:display]} | #{@bm[:c5][:display]} | #{@bm[:c6][:display]} | #{@bm[:c7][:display]} | #{@bm[:c8][:display]} |
    +---+---+---+---+---+---+---+---+
  4 | #{@bm[:d1][:display]} | #{@bm[:d2][:display]} | #{@bm[:d3][:display]} | #{@bm[:d4][:display]} | #{@bm[:d5][:display]} | #{@bm[:d6][:display]} | #{@bm[:d7][:display]} | #{@bm[:d8][:display]} |
    +---+---+---+---+---+---+---+---+
  5 | #{@bm[:e1][:display]} | #{@bm[:e2][:display]} | #{@bm[:e3][:display]} | #{@bm[:e4][:display]} | #{@bm[:e5][:display]} | #{@bm[:e6][:display]} | #{@bm[:e7][:display]} | #{@bm[:e8][:display]} |
    +---+---+---+---+---+---+---+---+
  6 | #{@bm[:f1][:display]} | #{@bm[:f2][:display]} | #{@bm[:f3][:display]} | #{@bm[:f4][:display]} | #{@bm[:f5][:display]} | #{@bm[:f6][:display]} | #{@bm[:f7][:display]} | #{@bm[:f8][:display]} |
    +---+---+---+---+---+---+---+---+
  7 | #{@bm[:g1][:display]} | #{@bm[:g2][:display]} | #{@bm[:g3][:display]} | #{@bm[:g4][:display]} | #{@bm[:g5][:display]} | #{@bm[:g6][:display]} | #{@bm[:g7][:display]} | #{@bm[:g8][:display]} |
    +---+---+---+---+---+---+---+---+
  8 | #{@bm[:h1][:display]} | #{@bm[:h2][:display]} | #{@bm[:h3][:display]} | #{@bm[:h4][:display]} | #{@bm[:h5][:display]} | #{@bm[:h6][:display]} | #{@bm[:h7][:display]} | #{@bm[:h8][:display]} |
    +---+---+---+---+---+---+---+---+
    }
  end
end
