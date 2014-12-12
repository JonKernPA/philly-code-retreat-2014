require './model/board'
RSpec.describe Board do
  describe 'initialization' do
    it 'can be initialized with an array' do
      arr = [
          [1, 0, 0],
          [0, 0, 0],
          [0, 0, 0],
      ]
      board = Board.new(arr)

      expect(board.width).to eq(3)
      expect(board.height).to eq(3)

    end

    it 'has width' do
      board = Board.new([[1,0,0]])
      expect(board.width).to eq(3)
    end

    it 'has height' do
      board = Board.new([[1,0,0]])
      expect(board.height).to eq(1)
    end

  end


  # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
  describe 'Rule #1' do
    it "left top" do
      arr = [
          [1, 0, 0],
          [0, 0, 0],
          [0, 0, 0],
      ]
      board = Board.new(arr)
      state = board.tick

      next_arr = [
          [0, 0, 0],
          [0, 0, 0],
          [0, 0, 0],
      ]
      expect(state).to eq(next_arr)
    end

    it "middle top" do
      arr = [
          [0, 1, 0],
          [0, 0, 0],
          [0, 0, 0],
      ]
      board = Board.new(arr)
      state = board.tick

      next_arr = [
          [0, 0, 0],
          [0, 0, 0],
          [0, 0, 0],
      ]
      expect(state).to eq(next_arr)
    end
  end

  # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
  describe 'Rule #4' do
    it "left top" do
      arr = [
          [0, 1, 0],
          [1, 1, 0],
          [0, 0, 0],
      ]
      board = Board.new(arr)
      state = board.tick

      next_arr = [
          [1, 1, 0],
          [1, 1, 0],
          [0, 0, 0],
      ]
      expect(state).to eq(next_arr)
    end

  end

  describe 'evolve' do
    it 'evolves and lives due to Rule 4' do
      arr = [
          [0, 1, 0],
          [1, 1, 0],
          [0, 0, 0],
      ]
      board = Board.new(arr)
      r = 0
      c = 0
      expect(board.evolve(r,c)).to eq(true)
    end

    it 'evolves and dies due to Rule 1' do
      arr = [
          [0, 0, 0],
          [1, 0, 0],
          [0, 0, 0],
      ]
      board = Board.new(arr)
      r = 1
      c = 0
      expect(board.evolve(r,c)).to eq(false)
    end

  end
end