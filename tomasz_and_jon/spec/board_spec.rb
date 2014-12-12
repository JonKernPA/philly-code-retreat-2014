require './model/board'
RSpec.describe Board do
  describe 'Blinker' do
    it "oscillates from one to the other form" do
      # Given
      board = Board.new(
                       [
                           [0,0,0,0,0],
                           [0,0,0,0,0],
                           [0,1,1,1,0],
                           [0,0,0,0,0],
                           [0,0,0,0,0],
                       ]
      )
      # When
      board.tick
      # Then
      expected_state =
          [
              [0,0,0,0,0],
              [0,0,1,0,0],
              [0,0,1,0,0],
              [0,0,1,0,0],
              [0,0,0,0,0],
          ]
      expect(board.state).to eq(expected_state)
    end
  end
end