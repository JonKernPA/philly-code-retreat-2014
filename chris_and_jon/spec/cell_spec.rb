require './model/cell'
RSpec.describe Cell do
  describe '#alive?' do
    it "cell is alive by default" do
      cell = Cell.new
      expect(cell.alive?).to be true
    end
  end

  describe '#die'do
    it "cell can die" do
      cell = Cell.new
      cell.die
      expect(cell.alive?).to be false
    end
  end

  describe '#live'do
    it "cell can live" do
      cell = Cell.new
      cell.live
      expect(cell.alive?).to be true
    end
  end

  describe 'dead' do
    it "cell can be dead" do
      cell = Cell.new
      cell.die
      expect(cell.alive?).to be false
    end
  end

  describe 'neighbors' do
    it "cell has array of 8 neighbors" do
      cell = Cell.new
      neighbors = cell.neighbors()
      expect(neighbors.count).to eq(8)
    end
  end

  describe 'generation' do
    it 'neighbors of cell are cell objects' do
      cell = Cell.new
      neighbors = cell.neighbors()
      neighbor = neighbors.first
      expect(neighbor.alive?).to be true
      end
  end
end