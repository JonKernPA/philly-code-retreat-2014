class Cell

  def initialize
    @alive = true
  end

  def alive?
    @alive
  end

  def die
    @alive = false
  end
  def live
    @alive = true
  end

  def neighbors
    @neighbors ||= [Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new, Cell.new]
  end

  def update
    @alive = false
    count =0
    @neighbors.each do |c|
      count += 1 if c.alive?
    end
    if count==2 or count==3
      @alive = true
    else
      @alive = false
    end
    @alive
  end
end