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
    if @neighbors
    else
      @neighbors = []
      8.times do
        cell = Cell.new
        cell.live
        @neighbors << cell
      end
    end
    @neighbors
  end

  def update
    live_count = number_live_neighbors
    self.live if in_reproductive_state(live_count) or in_balanced_state(live_count)
    self.die if in_a_bad_state(live_count)
  end

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

  def number_live_neighbors
    live_count = @neighbors.select { |c| c.alive? }.count
  end
end