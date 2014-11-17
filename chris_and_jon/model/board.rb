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
end