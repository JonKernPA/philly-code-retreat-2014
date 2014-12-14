# A great way to run this app (from IRB at the model directory)
#     2.1.2 :003 > require './board'
#     2.1.2 :004 > board = Board.new(50); board.run(100)

class Board

  def initialize(initial_state)
    if initial_state.kind_of? Array
      @state = initial_state
    else
      @state = randomized_array(initial_state)
    end
    @sleep = 2.0/[number_rows,number_columns].max
  end

  def randomized_array(dim)
    rows = Array.new(dim)
    rows.each_with_index do |row, i|
      arr = Array.new(dim)
      arr.fill {|c| rand(2)}
      rows[i] = arr
    end
    rows
  end

  DEAD = 0
  ALIVE = 1

  def tick
    new_state = Array.new(number_rows) { Array.new(number_columns) }

    (1..number_rows).each do |r|
      (1..number_columns).each do |c|
        current_cell = cell(r, c)

        live_count = live_neighbors(r, c)

        if current_cell == ALIVE
          # Live
          cell_state = case live_count
                         # Any live cell with fewer than two live neighbours dies, as if caused by under-population.
                         when 0..1
                           DEAD
                         # Any live cell with two or three live neighbours lives on to the next generation.
                         when 2..3
                           ALIVE
                         # Any live cell with more than three live neighbours dies, as if by overcrowding.
                         else
                           DEAD
                       end
        elsif current_cell == DEAD
          # Dead
          # Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
          if live_count == 3
            cell_state = ALIVE
          else
            cell_state = DEAD
          end
        else
          STDERR.print "Houston, we have a problem... Cells cannot be in between Alive and Dead!"
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
    old_state = nil
    evolutions.times.each do |i|
      older_state = old_state if old_state
      old_state = @state
      sleep @sleep
      tick
      STDERR.puts print_array

      if old_state == @state || older_state == @state
        $stderr.puts "Board has not evolved"
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