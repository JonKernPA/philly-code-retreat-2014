class Cell

  def initialize
    @state = true
  end

  def alive?
    @state
  end

  def live
    @state = true
  end

  def die
    @state = false
  end

  def neighbors
    @neighbors = []
    8.times do
      cell = Cell.new
      cell.live
      @neighbors << cell
    end
    @neighbors
  end
end