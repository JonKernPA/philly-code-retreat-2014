class World

  def initialize
    @cells = []
    @num_rows = 2
    @num_cols = 2

    row = 0
    @num_rows.times do |row|
      a_row = []
      @num_cols.times do |col|
        a_row[col] << Cell.new(true)
      end
      @cells[row] = a_row
    end
    puts cells
  end

  def num_rows
    @num_rows
  end

  def num_cols
    @num_cols
  end

  def cell(x,y)

  end

  def alive_count
    @cells.flatten.select { |c| c.alive? }.count
  end

  def add_cell(cell, coordinates)
    @cells[coordinates[0], coordinates[1]] = cell
=begin
    if @cells.count == 0
      @cells = [cell]
    elsif @cells.count == 1
      if @cells[0].count < 2
        @cells[0] << cell
      else
        @
      end
    end
=end

  end

  def next_generation
    @cells.each { |c| c.die}
  end
end