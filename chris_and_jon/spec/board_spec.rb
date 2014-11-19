require './model/board'
require 'awesome_print'

RSpec.describe Board do

  it "is initialized as a 2D grid" do
    board = Board.new(4, 5)
    expect(board).to_not be_nil
  end

  it "has a 2D dimension" do
    board = Board.new(4, 5)
    expect(board.dimensions).to eq([4,5])
  end

  it "has addressable cells at each row/column vertex" do
    board = Board.new(4, 5)
    expect(board.cell(2,3)).to be_a_kind_of(Cell)
  end
  
  it "can set a specific cell" do
    board = Board.new(4, 5)
    cell = Cell.new(Cell::DEAD)
    puts cell
    board[2,3] = (cell)
    expect(board[2,3]).to be_a_kind_of(Cell)
    expect(board[2,3].alive?).to be false
  end

  it 'sets cell neighbors' do
    board = Board.new(1,3)
    cell_0_0 = Cell.new(Cell::DEAD)
    cell_0_1 = Cell.new(Cell::ALIVE)
    cell_0_2 = Cell.new(Cell::DEAD)

    board[0,0] = cell_0_0
    board[0,1] = cell_0_1
    board[0,2] = cell_0_2

    board.set_neighbors
    puts board
    # ap board[0,0].neighbors
    # ap board[0,1].neighbors

    expect(board[0,0].neighbors[Cell::LEFT]).to eq(nil)
    expect(board[0,0].neighbors[Cell::RIGHT]).to eq(cell_0_1)
    expect(board[0,1].neighbors[Cell::LEFT]).to eq(cell_0_0)
    expect(board[0,1].neighbors[Cell::RIGHT]).to eq(cell_0_2)
  end

  it "can evolve to the next generation" do

  end

end