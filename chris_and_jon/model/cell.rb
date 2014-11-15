class Cell

  def initialize
    @state = true
  end

  def alive?
    @state
  end

  def state(state)
    @state = state
  end

  def neighbors
    [1,2,3,4,5,6,7,8]
  end
end