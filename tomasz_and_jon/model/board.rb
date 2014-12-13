class Board

  def initialize(initial_state)
    @state = initial_state

  end

  def tick
    new_state = Array.new(number_rows) { Array.new(number_columns) }

    (1..number_rows).each do |r|
      (1..number_columns).each do |c|
        current_cell = cell(r, c)

        live_count = live_neighbors(r, c)

        if current_cell == 1
          # Live
          cell_state = case live_count
                         # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
                         when 0..1
                           0
                         # Any live cell with two or three live neighbours lives on to the next generation.
                         when 2..3
                           1
                         # Any live cell with more than three live neighbours dies, as if by overcrowding.
                         else
                           0
                       end
        else
          # Dead
          # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
          if live_count == 3
            cell_state = 1
          else
            cell_state = 0
          end
        end
        new_state[r - 1][c - 1] = cell_state
      end
    end
    @state = new_state
  end

  def number_rows
    @state.count
  end

  def number_columns
    @state.first.count
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
    max_row = [row + 1, number_rows - 1].min
    min_col = [col - 1, 0].max
    max_col = [col + 1, number_columns - 1].min

    (min_row..max_row).each do |r|
      count += (min_col..max_col).inject(0) {|count,c| count + @state[r][c]}
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