require './model/cell'

class Board

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @grid = Array.new(rows) {Array.new(cols) {Cell.new}}
  end

  def dimensions
    [@rows, @cols]
  end

  def cell(row, col)
    @grid[row][col]
  end

  def [](row, col)
    @grid[row][col]
  end

  def []=(row, col, cell)
    @grid[row][col] = cell
  end
end