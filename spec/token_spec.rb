require_relative "../lib/token.rb"

RSpec.describe Rook do


  describe ".check_rook_move" do
    context "given a Rook possible move location" do
      it "returns true if move is possible" do
        rook = Rook.new("W",2,3)

        expect(rook.check_rook_move([3,3])).to eq(true)
      end
    end
  end
end