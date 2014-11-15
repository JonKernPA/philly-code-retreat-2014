require './model/cell'
RSpec.describe Cell do

  describe '#neighbors' do
    it 'has 8 neighbors' do
      cell = Cell.new
      expect(cell.neighbors.count).to eq(8)
    end
  end

  describe '#set_neighbor_at' do
    it 'sets the cell at a given location' do
      cell = Cell.new
      neighbor = Cell.new
      cell.set_neighbor_at(neighbor,0)
      expect(cell.neighbors[0]).to be neighbor
    end
  end

  #1. Any live cell with less than two live neighbours dies, as if caused by under-population.
  describe '#should_die?' do
    it "returns true if there are less than two live neighbors" do
      cell = Cell.new()
      cell.set_neighbor_at(Cell.new.die,0)
      cell.set_neighbor_at(Cell.new.die,1)
      cell.set_neighbor_at(Cell.new.die,2)
      cell.set_neighbor_at(Cell.new.die,3)

      cell.set_neighbor_at(Cell.new.die,4)
      cell.set_neighbor_at(Cell.new.die,5)
      cell.set_neighbor_at(Cell.new.die,6)
      cell.set_neighbor_at(Cell.new.die,7)

      expect(cell.should_die?).to be true
    end
  end

  describe '#alive?' do
    it 'returns true if alive' do
      cell = Cell.new

      expect(cell.alive?).to be true
    end

    it 'returns false if not alive' do
      cell = Cell.new
      cell.die
      expect(cell.alive?).to be false
    end
  end
end