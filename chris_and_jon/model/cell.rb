class Cell

  ALIVE = 1
  DEAD = 2
  
  UPPER_LEFT  = 0
  UPPER       = 1
  UPPER_RIGHT = 2
  RIGHT       = 3
  LOWER_RIGHT = 4
  LOWER       = 5
  LOWER_LEFT  = 6
  LEFT        = 7

  def initialize(state = ALIVE)
    @state = state
  end

  def alive?
    @state == ALIVE
  end

  def dead?
    @state == DEAD
  end

  def live
    @state = ALIVE
  end

  def die
    @state = DEAD
  end

  def neighbors
    @neighbors ||= Array.new(8) { Cell.new }
  end

  def update
    self.live if in_reproductive_state(live_neighbors) or in_balanced_state(live_neighbors)
    self.die if in_a_bad_state(live_neighbors)
  end

  def to_s
    "ALIVE" if alive?
    "DEAD" if dead?
  end

  private

  def in_balanced_state(live_count)
    self.alive? and (live_count == 2 or live_count == 3)
  end

  def in_overcrowded_state(live_count)
    self.alive? and live_count > 3
  end

  def in_underpopulated_state(live_count)
    self.alive? and live_count < 2
  end

  def in_a_bad_state(live_count)
    in_overcrowded_state(live_count) or in_underpopulated_state(live_count)
  end

  def in_reproductive_state(live_count)
    !self.alive? and live_count == 3
  end

  def live_neighbors
    @neighbors.select { |c| c.alive? }.count
  end
end