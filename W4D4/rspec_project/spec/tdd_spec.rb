require 'rspec'
require 'tdd.rb'

# describe "Array" do 

#   describe "#uniq" do 
#       it 'returns an array of non repeating elements' do
#         expect([3,3,3].uniq).to eq([3])
#       end
#       it "returns a new array" do
#         expect([1,2,3].uniq.object_id).to_not be(self.object_id)
#       end
#   end

#   describe "#two_sum" do
#     let(:arr) { [-1, 0, 2, -2, 1] }
#     let(:pairs) { [[0, 4], [2, 3]] }

#     # it "should return indices of elements that sum to 0" do 
#     #   expect(two_sums.two_sum).to eq(0)
#     # end

#     it "should have idx of first element < idx of second element" do
#       expect(arr.two_sum).to match_array([[0, 4], [2, 3]])
#     end
  
#   end

#   # Check that we are not using #array.tranpose
#   # Should tranpose the array
#   # Correctly tranposes an empty array
#   # Keep the same dimensions
#   describe "#my_transpose" do
#     let(:arr) { [[0, 1, 2], [3, 4, 5],[6, 7, 8]] }

#     it "should not use #tranpose" do
#       expect(arr.my_transpose).not_to receive(:transpose)
#     end

#     it "should transpose the array" do 
#       expect(arr.my_transpose).to match_array([[0, 3, 6],[1, 4, 7],[2, 5, 8]])
#     end

#     it "correctly transposes an empty array" do
#       expect([].my_transpose).to eq([])
#     end

#     it "keeps the same dimensions" do
#       expect(arr.my_transpose.length).to eq(arr.my_transpose[0].length)
#     end
#   end
# end

# describe "#stock_picker" do 
#   let(:arr) { [5,1,7,3,15,7,8] }

#   it "should return the most profitable pair of days to buy and sell" do
#     expect(stock_picker(arr)).to eq([1,4])
#   end
  
#   it "should take into account same costs / prices" do
#     expect(stock_picker([1,1,1,2,1,1])).to eq([2,3])
#   end

#   it "returns nil if there are no profitable days" do
#     expect(stock_picker([8,7,6,5,4,3,2])).to eq([])
#   end
# end

describe "Towers of Hanoi" do
  subject(:newgame) {(TowersOfHanoi.new)}
  describe "#initialize" do 

    context "Create the game" do
      it 'should create three arrays' do
        expect(newgame.stack1.is_a?(Array)).to be true
        expect(newgame.stack2.is_a?(Array)).to be true
        expect(newgame.stack3.is_a?(Array)).to be true
      end

      it 'should populate the first array of a tower of five' do 
        expect(newgame.stack1).to eq([5,4,3,2,1])
        expect(newgame.stack2.empty?).to be true
        expect(newgame.stack3.empty?).to be true
      end

    end
  end

  describe "#move" do     # legality of the move, not actual move
    it "should pop last item from stack" do
      expect(newgame.move).to eq(1)   # move is instance method
      expect(newgame.move).to eq(1)
    end
    
    it 'should take in an array as a position' do    # should take argument
      allow(newgame.move).to receive(Array)
    end

    it 'should be the smallest item in the array' do  # smallest item in the array
      expect(newgame)
    end

    it 'must take from a non-empty stack' do   # check that it exists, ie stack != nil
      expect(newgame.move).to not_be nil
    end
    
    # cannot go on a smaller piece
    # can move on empty stack o larger disk

  end

  describe "#won?" do 
    it "checks if all the layers are correctly on stack3" do
      expect(newgame.stack1.empty?).to be true
      expect(newgame.stack2.empty?).to be true
      expect(newgame.stack3).to eq([5,4,3,2,1])
    end
  end

  # describe "#play"
  # 1 3 => [1,3] => from @stack1 to @stack3

end

