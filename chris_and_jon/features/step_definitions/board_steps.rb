require 'awesome_print'
require '././model/board'
Given(/^A board set up as follows:$/) do |table|
  # table is a table.hashes.keys # => [:-, :-, :-, :-]
  num_rows = table.raw.count
  num_cols = table.raw.first.count
  @board = Board.new(num_rows, num_cols)

  table.raw.each do |row|
    row.each do |cell|

    end
  end
end

Then(/^I should have a board with (\d+) rows and (\d+) columns$/) do |rows, cols|
  @board.dimensions.should == [rows.to_i, cols.to_i]
end


When(/^I evolve to the next generation$/) do
  pending # express the regexp above with the code you wish you had
end


Then(/^I should see the board as follows:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end