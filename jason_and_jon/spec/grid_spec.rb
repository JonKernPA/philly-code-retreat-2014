require './model/grid'
RSpec.describe Grid do
  describe 'Grid' do
    it "is a two-dimensional grid of X and Y units" do
      grid = Grid.new(10,20)
      expect(grid.number_cells).to eq(10*20)
    end

    it "should be populated" do
      grid = Grid.new(10,20)
      expect(grid.get_cell(5,7)).to be true
    end

    it "should update the grid" do
      grid = Grid.new(10,20)
      grid.update
      expect(grid.get_cell(5,7)).to be true
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