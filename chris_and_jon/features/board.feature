Feature: The Game of Life is a board game, of sorts...
  From the wiki...
  The universe of the Game of Life is an infinite two-dimensional orthogonal grid of square
  cells, each of which is in one of two possible states, alive or dead. Every cell interacts
  with its eight neighbours, which are the cells that are horizontally, vertically, or
  diagonally adjacent. At each step in time, the following transitions occur:

  1. Any live cell with less than two live neighbours dies, as if caused by under-population.
  2. Any live cell with two or three live neighbours lives on to the next generation.
  3. Any live cell with more than three live neighbours dies, as if by overcrowding.
  4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.

  The initial pattern constitutes the seed of the system. The first generation is created by applying the above rules simultaneously to every cell in the seed—births and deaths occur simultaneously, and the discrete moment at which this happens is sometimes called a tick (in other words, each generation is a pure function of the preceding one). The rules continue to be applied repeatedly to create further generations.

  Scenario: A board can be set up to a certain size
    Given A board set up as follows:
      | - | - | - | - |
      | - | + | + | - |
      | - | + | - | - |
      | - | - | - | + |
    Then I should have a board with 4 rows and 4 columns
    And The cell at row 0, col 0 is dead
    And The cell at row 1, col 1 is alive
    And The cell at row 1, col 2 is alive
    And The cell at row 2, col 1 is alive
    And The cell at row 2, col 2 is dead
    And The cell at row 3, col 3 is alive

  @wip
  Scenario: The board is responsible for setting the cell neighbors
    Given A board set up as follows:
      | - | - | - | - |
      | - | + | + | - |
      | - | + | - | - |
      | - | - | - | + |
    Then The following neighbors should exist
      | row | col | ul  | u   | ur  | r | lr | l | ll  | l   |
      | 0   | 0   | nil | nil | nil | - | +  | - | nil | nil |

  Scenario: Prove a blinker pattern works
    Given A board set up as follows:
      | - | - | - | - | - |
      | - | - | - | - | - |
      | - | + | + | + | - |
      | - | - | - | - | - |
      | - | - | - | - | - |
    When I evolve to the next generation
    Then I should see the board as follows:
      | - | - | - | - | - |
      | - | - | + | - | - |
      | - | - | + | - | - |
      | - | - | + | - | - |
      | - | - | - | - | - |
