require './model/cell'

class Board

  def initialize(rows, cols)
    @rows = rows
    @cols = cols
    @grid = Array.new(@rows) {Array.new(@cols) {Cell.new}}
  end

  def evolve

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

  def set_neighbors
    @grid.each_with_index do |cols, row|
      ap "Cols: #{cols}"
      cols.each_with_index do |cell, col|
        # ap cell.neighbors
        (0..7).each {|i| cell.neighbors[i] = nil}
        n = cell.neighbors
        if (row-1) >= 0
          n[Cell::UPPER_LEFT]  = @grid[row-1][col-1] if (col-1) > 0
          n[Cell::UPPER]       = @grid[row-1][col+0]
          n[Cell::UPPER_RIGHT] = @grid[row-1][col+1] if (col+1) < @cols
        end
        n[Cell::LEFT]        = @grid[row+0][col-1] if (col-1) >= 0
        n[Cell::RIGHT]       = @grid[row+0][col+1] if (col+1) < @cols
        if (row+1) < @rows
          n[Cell::LOWER_RIGHT] = @grid[row+1][col+1] if (col+1) < @cols
          n[Cell::LOWER]       = @grid[row+1][col+0]
          n[Cell::LOWER_LEFT]  = @grid[row+1][col-1] if (col-1) >= 0
        end
      end
    end
  end

  def to_s
    text = "#{@rows}x#{@cols}\n"
    @grid.each do |row|
      row.each do |cell|
        text += "| #{cell.alive? ? '+' : '-'} "
      end
      text += "|\n"
    end
    text
  end
end