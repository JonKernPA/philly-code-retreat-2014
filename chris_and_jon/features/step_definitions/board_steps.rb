require 'awesome_print'
require '././model/cell'
require '././model/board'
Given(/^A board set up as follows:$/) do |table|
  # table is a table.hashes.keys # => [:-, :-, :-, :-]
  num_rows = table.raw.count
  num_cols = table.raw.first.count
  @board = Board.new(num_rows, num_cols)

  table.raw.each_with_index do |row, y|
    row.each_with_index do |state, x|
      initial_state = state == '+' ? Cell::ALIVE : Cell::DEAD
      print "| #{state} "
      cell = Cell.new(initial_state)
      @board[x,y] = cell
    end
    print "|\n"
  end
  # table.raw.each_with_index do |row, y|
  #   row.each_with_index do |state, x|
  #     initial_state = state == '+' ? Cell::ALIVE : Cell::DEAD
  #     cell = Cell.new(initial_state)
  #     @board[x,y] = cell
  #   end
  # end
end

Then(/^I should have a board with (\d+) rows and (\d+) columns$/) do |rows, cols|
  @board.dimensions.should == [rows.to_i, cols.to_i]
end

And(/^The cell at row (\d+), col (\d+) is (\w+)$/) do |row, col, state|
  cell = @board[row.to_i,col.to_i]
  if state == "alive"
    expect(cell.alive?).to be true
  end
  if state == "dead"
    expect(cell.dead?).to be true
  end

end



When(/^I evolve to the next generation$/) do
  pending # express the regexp above with the code you wish you had
end


Then(/^I should see the board as follows:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end