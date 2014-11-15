class Cell

  def initialize(liveliness)
    @alive = liveliness
  end

  def alive?
    @alive
  end

  def die
    @alive = false
  end
end