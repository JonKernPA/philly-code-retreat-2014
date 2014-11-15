require './model/cell'
RSpec.describe Cell do
  describe '#alive?' do
    it "cell is alive by default" do
      cell = Cell.new
      expect(cell.alive?).to be true
    end
  end

  describe '#die' do
    it "cell can die" do
      cell = Cell.new
      cell.die
      expect(cell.alive?).to be false
    end
  end

  describe '#live' do
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

    it 'set specific neighbors' do
      cell = Cell.new
      neighbors = cell.neighbors()
      neighbors[1].die
      expect(neighbors[1].alive?).to be false
    end
  end

  describe 'rule 4' do

    it 'if cell is dead and has exactly 3 alive neighbors, become alive' do
      cell = Cell.new
      neighbors = cell.neighbors()
      cell.die
      neighbors[0].die
      neighbors[1].die
      neighbors[2].die
      neighbors[3].die
      neighbors[4].die
      cell.update
      expect(cell.alive?).to be true
      
    end
  end
end