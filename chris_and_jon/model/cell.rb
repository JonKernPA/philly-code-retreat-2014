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
    [1,2,3,4,5,6,7,8]
  end
end