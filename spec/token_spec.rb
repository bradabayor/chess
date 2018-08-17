require_relative "../lib/token.rb"

RSpec.describe Rook do


  describe ".check_rook_move" do
    context "given a Rook possible move location" do
      rook = Rook.new("W",2,3)

      it "returns false if location is at origin" do
        expect(rook.check_rook_move([2,3])).to eq(false)
      end

      it "returns false if location is off the game board" do
        expect(rook.check_rook_move([8,1])).to eq(false)
      end

      it "returns true if location is horizontal to origin" do
        expect(rook.check_rook_move([8,1])).to eq(true)
      end

      it "returns true if location is vertical to origin" do
        expect(rook.check_rook_move([8,1])).to eq(true)
      end

    end
  end
end