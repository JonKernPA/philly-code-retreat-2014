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

end