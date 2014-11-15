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
end