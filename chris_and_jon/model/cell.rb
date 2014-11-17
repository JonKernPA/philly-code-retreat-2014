class Cell

  def initialize
    @state = true
  end

  def alive?
    @state == true
  end

  def dead?
    @state == false
  end

  def live
    @state = true
  end

  def die
    @state = false
  end

  def neighbors
    @neighbors ||= begin
      Array.new(8){ Cell.new }
    end
    @neighbors
  end

  def update
    self.live if in_reproductive_state(live_neighbors) or in_balanced_state(live_neighbors)
    self.die if in_a_bad_state(live_neighbors)
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