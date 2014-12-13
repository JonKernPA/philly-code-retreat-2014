require './model/board'
RSpec.describe Board do
  describe 'Board Basics' do
    it "can be initialized with a 2D array" do
      # Given
      initial_state = [
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 1, 1, 1, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      # When/Then
      expect(board.state).to eq(initial_state)

    end

    describe '#rules' do
      # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
      it 'Rule #1 under-population' do
        # Given
        initial_state = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 1, 1, 1, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
        ]
        board = Board.new(initial_state)
        # When
        board.tick
        expect(board.cell(3, 2)).to eq(0)
      end

      # Any live cell with more than three live neighbours dies, as if by overcrowding.
      it 'Rule #2 overcrowding' do
        # Given
        initial_state = [
            [0, 0, 0, 0, 0],
            [0, 0, 1, 0, 0],
            [0, 1, 1, 1, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0],
        ]
        board = Board.new(initial_state)
        # When
        board.tick
        expect(board.cell(3, 3)).to eq(0)
      end

      # Any live cell with two or three live neighbours lives on to the next generation.
      it 'Rule #3 lives on' do
        # Given
        initial_state = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 1, 1, 1, 0],
            [0, 0, 1, 0, 0],
            [0, 0, 0, 0, 0],
        ]
        board = Board.new(initial_state)
        # When
        board.tick
        expect(board.cell(3, 3)).to eq(1)
        expect(board.cell(3, 2)).to eq(1)
      end

      # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
      it 'Rule #4 reproduction' do
        # Given
        initial_state = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 1, 1, 1, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
        ]
        board = Board.new(initial_state)
        # When
        board.tick
        expect(board.cell(2, 3)).to eq(1)
      end

      # Any live cell with fewer than two live neighbours dies,
      it 'counts live neighbors' do
        # Given
        initial_state = [
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
            [0, 1, 1, 1, 0],
            [0, 0, 0, 0, 0],
            [0, 0, 0, 0, 0],
        ]
        board = Board.new(initial_state)
        expect(board.live_neighbors(3, 3)).to eq(2)
        expect(board.live_neighbors(3, 2)).to eq(1)
      end
    end

    describe '#print_array' do
      it 'should produce text output for the array' do
        # Given
        initial_state = [
            [0, 0],
            [0, 1],
        ]
        board = Board.new(initial_state)
        expected_state = "░░\n░█"
        expect(board.print_array).to eq(expected_state)
      end
    end

  end

  describe 'Classic Patterns' do
    it 'Block Still Life' do
      # Given
      initial_state = [
          [0, 0, 0, 0],
          [0, 1, 1, 0],
          [0, 1, 1, 0],
          [0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      # When
      board.tick
      # Then
      expect(board.state).to eq(initial_state)
    end

    it 'Beehive Still Life' do
      # Given
      initial_state = [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 1, 0, 0, 1, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      # When
      board.tick
      # Then
      expect(board.state).to eq(initial_state)
    end

    it 'Loaf Still Life' do
      # Given
      initial_state = [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 1, 0, 0, 1, 0],
          [0, 0, 1, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      # When
      board.tick
      # Then
      expect(board.state).to eq(initial_state)
    end

    it 'Boat Still Life' do
      # Given
      initial_state = [
          [0, 0, 0, 0, 0],
          [0, 1, 1, 0, 0],
          [0, 1, 0, 1, 0],
          [0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      # When
      board.tick
      # Then
      expect(board.state).to eq(initial_state)
    end

    it "Blinker oscillates from horizontal to vertical form" do
      # Given
      initial_state = [
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 1, 1, 1, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      # When
      board.tick
      # Then
      expected_state =
          [
              [0, 0, 0, 0, 0],
              [0, 0, 1, 0, 0],
              [0, 0, 1, 0, 0],
              [0, 0, 1, 0, 0],
              [0, 0, 0, 0, 0],
          ]
      expect(board.state).to eq(expected_state)
      board.tick
      expect(board.state).to eq(initial_state)
    end

    it "Toad blinker" do
      # Given
      initial_state = [
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 1, 1, 1, 0],
          [0, 1, 1, 1, 0, 0],
          [0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      # When
      board.tick
      # Then
      expected_state =
          [
              [0, 0, 0, 0, 0, 0],
              [0, 0, 0, 1, 0, 0],
              [0, 1, 0, 0, 1, 0],
              [0, 1, 0, 0, 1, 0],
              [0, 0, 1, 0, 0, 0],
              [0, 0, 0, 0, 0, 0],
          ]
      expect(board.state).to eq(expected_state)
      board.tick
      expect(board.state).to eq(initial_state)
    end

    it "Beacon blinker" do
      # Given
      initial_state = [
          [0, 0, 0, 0, 0, 0],
          [0, 1, 1, 0, 0, 0],
          [0, 1, 1, 0, 0, 0],
          [0, 0, 0, 1, 1, 0],
          [0, 0, 0, 1, 1, 0],
          [0, 0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      # When
      board.tick
      # Then
      expected_state =
          [
              [0, 0, 0, 0, 0, 0],
              [0, 1, 1, 0, 0, 0],
              [0, 1, 0, 0, 0, 0],
              [0, 0, 0, 0, 1, 0],
              [0, 0, 0, 1, 1, 0],
              [0, 0, 0, 0, 0, 0],
          ]
      expect(board.state).to eq(expected_state)
      board.tick
      expect(board.state).to eq(initial_state)
    end
  end
  describe 'run' do
    it 'runs a few ticks' do
      initial_state = [
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 1, 1, 1, 0, 0, 1, 1, 1, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 1, 1, 1, 0, 0, 1, 1, 1, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)

      board.run(10)
    end

    it 'runs non-square' do
      initial_state = [
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 1, 1, 1, 0, 0, 1, 1, 1, 0],
          [0, 0, 1, 0, 0, 0, 0, 1, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      board.run(10)
    end

    it 'runs a blinker' do
      initial_state = [
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
          [0, 1, 1, 1, 0],
          [0, 0, 0, 0, 0],
          [0, 0, 0, 0, 0],
      ]
      board = Board.new(initial_state)
      board.run(5)
    end
  end
end