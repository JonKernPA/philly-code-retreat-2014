class Board

  def initialize(arr)
    @state = arr
  end

  def height
    @state.count
  end

  def width
    @state.first.count
  end

  def tick
    @next_state = @state
    height.times.each do |row|
      width.times.each do |col|
        # How many live neighbors?
        evolve(row, col)

      end
    end
  end

  def evolve(row,col)
    if @state[row][col]
      # ALIVE
      if live_neighbors < 2
        @next_state[row][col] = false
      end
    else
      #DEAD

    end

  end
end