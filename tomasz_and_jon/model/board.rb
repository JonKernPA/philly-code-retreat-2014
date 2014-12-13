class Board

  def initialize(initial_state)
    @state = initial_state

  end

  def tick
    rows = @state.count
    cols = @state.first.count

    new_state = Array.new(rows){Array.new(cols)}

    (1..rows).each do |r|
      (1..cols).each do |c|
        current_cell = cell(r,c)

        live_count = live_neighbors(r,c)

        cell_state = 0

        if current_cell == 1
          # Live
          # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
          if live_count < 2
            cell_state = 0
          end
          # Any live cell with two or three live neighbours lives on to the next generation.
          if live_count == 2 || live_count == 3
            cell_state = 1
          end
          # Any live cell with more than three live neighbours dies, as if by overcrowding.
          if live_count > 3
            cell_state = 0
          end

        else
          # Dead
          # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
          if live_count == 3
            cell_state = 1
          end
        end
        new_state[r - 1][c - 1] = cell_state
                                                                                                                                                                     end
    end
    @state = new_state
  end

  def cell(cell_row, cell_col)
    @state[cell_row - 1][cell_col - 1]
  end

  # Humans enter 1-based rows and cols
  def live_neighbors(cell_row, cell_col)
    count = 0
    row = cell_row - 1
    col = cell_col - 1

    min_row = [row - 1, 0].max
    max_row = [row + 1, @state.count - 1].min
    min_col = [col - 1, 0].max
    max_col = [col + 1, @state.first.count - 1].min

    (min_row..max_row).each do |r|
      (min_col..max_col).each do |c|
        # puts "for #{r}:#{c} ==> #{@state[r][c]}"
        count += @state[r][c]
      end
    end
    count - @state[row][col]
  end

  def state
    @state
  end

  def run(evolutions)
    evolutions.times.each do |i|
      old_state = @state
      sleep 0.5
      tick
      STDERR.puts print_array
      if old_state == @state
        puts "Board has not evolved"
        break
      end
    end
  end

  def print_array
    # A trick to clear the board (from Chad Fowler)
    STDERR.print "\e[2J\e[f"
    text = ''
    text += @state.map do |row|
      row.collect do |c|
        c == 0 ? '░' : '█'
      end.join('')
    end.join("\n")
  end
end