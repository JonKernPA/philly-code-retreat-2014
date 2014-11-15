class Cell

  def initialize
    @alive = true
  end

  def neighbors
    @neighbors ||= (1..8).to_a
  end

  def set_neighbor_at(neighbor, location)
    neighbors[location] = neighbor
  end

  def alive?
    @alive
  end

  def die
    @alive = false
  end
end