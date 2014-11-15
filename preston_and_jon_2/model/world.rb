class World

  def initialize
    @cells = []
  end

  def alive_count
    @cells.select { |c| c.alive? }.count
  end

  def add_cell(cell)
    @cells << cell
  end

  def next_generation
    @cells.each { |c| c.die}
  end
end