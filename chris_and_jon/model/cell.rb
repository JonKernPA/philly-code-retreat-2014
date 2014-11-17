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

    if !self.alive? and live_count == 3
      self.live
    elsif self.alive? and (live_count > 3 or live_count < 2)
      self.die
    elsif self.alive? and (live_count == 2 or live_count == 3)
      self.live
    end
  end

  def number_live_neighbors
    live_count = @neighbors.select { |c| c.alive? }.count
  end
end