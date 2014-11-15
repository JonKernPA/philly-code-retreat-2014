require './model/grid'
RSpec.describe Grid do

  def kill_all_around(grid, x,y)
    grid.set_cell(x-1,y,false)
    grid.set_cell(x+1,y,false)
    grid.set_cell(x,y-1,false)
    grid.set_cell(x,y+1,false)
    grid.set_cell(x-1,y-1,false)
    grid.set_cell(x+1,y-1,false)
    grid.set_cell(x+1,y+1,false)
    grid.set_cell(x+1,y-1,false)
  end
  describe 'Grid' do
    it "is a two-dimensional grid of X and Y units" do
      grid = Grid.new(10,20)
      expect(grid.number_cells).to eq(10*20)
    end

    it "should be populated" do
      grid = Grid.new(10,20)
      expect(grid.get_cell(5,7)).to be true
    end

    # 1. Any live cell with less than two live neighbours dies, as if caused by under-population.
    it "should kill cell if it has less than two live neighbours" do
      grid = Grid.new(10, 10)
      grid.set_cell(5,5,true)
      grid.update
      expect(grid.get_cell(5,5)).to be false
    end

    # 4. Any dead cell with exactly three live neighbours becomes a live cell, as if by reproduction.
    it "cell should reproduce if there are three live neighbors" do
      grid = Grid.new(10,10)

      # dead cell
      grid.set_cell(5,5,false)

      kill_all_around(grid,5,5)

      grid.set_cell(4,5,true)
      grid.set_cell(5,6,true)
      grid.set_cell(6,5,true)

      grid.update
      expect(grid.get_cell(5,5)).to be true
    end
  end
end

# RSpec.describe Cell do
#   describe 'Cell' do
#     it "" do
#       grid = Grid.new(10,20)
#       expect(grid.number_cells).to eq(10*20)
#     end
#
#   end
# end