require './model/cell'
RSpec.describe Cell do
  describe 'the cell' do
    it "can live" do
      cell = Cell.new
      cell.live
      expect(cell.alive?).to be true
    end

    it "can be alive" do
      cell = Cell.new
      cell.live
      expect(cell.alive?).to be true
    end

    it "can die" do
      cell = Cell.new
      cell.die
      expect(cell.alive?).to be false
    end

    it "can be dead" do
      cell = Cell.new
      cell.die
      expect(cell.dead?).to be true
    end

  end

  describe 'neighbors' do
    it "cell has array of 8 neighbors" do
      cell = Cell.new
      expect(cell.neighbors.count).to eq(8)
    end
    it 'neighbors of cell are also cells' do
      cell = Cell.new
      expect(cell.neighbors.first).to be_a_kind_of(Cell)
    end
  end

  describe 'generational evolution' do

    it 'set specific neighbors' do
      cell = Cell.new
      neighbors = cell.neighbors
      neighbors[1].die
      expect(neighbors[1]).to be_dead
    end

    describe 'rule 4' do

      it 'if cell is dead and has exactly 3 alive neighbors, become alive' do
        cell = Cell.new
        neighbors = cell.neighbors
        cell.die
        neighbors[0].die
        neighbors[1].die
        neighbors[2].die
        neighbors[3].die
        neighbors[4].die
        neighbors[5].live
        neighbors[6].live
        neighbors[7].live
        cell.update
        expect(cell.alive?).to be true
      end
    end

    describe 'rule 3' do

      it 'if cell is alive and has > 3 alive neighbors, die' do
        cell = Cell.new
        neighbors = cell.neighbors
        cell.live
        neighbors[0].die
        neighbors[1].die
        neighbors[2].die
        neighbors[3].die
        neighbors[4].live
        neighbors[5].live
        neighbors[6].live
        neighbors[7].live
        cell.update
        expect(cell.alive?).to be false
      end
    end

    describe 'rule 2' do

      it 'if cell is alive and has 3 alive neighbors, live' do
        cell = Cell.new
        neighbors = cell.neighbors
        cell.live
        neighbors[0].die
        neighbors[1].die
        neighbors[2].die
        neighbors[3].die
        neighbors[4].die
        neighbors[5].live
        neighbors[6].live
        neighbors[7].live
        cell.update
        expect(cell.alive?).to be true
      end

      it 'if cell is alive and has 2 alive neighbors, live' do
        cell = Cell.new
        neighbors = cell.neighbors
        cell.live
        neighbors[0].die
        neighbors[1].die
        neighbors[2].die
        neighbors[3].die
        neighbors[4].die
        neighbors[5].die
        neighbors[6].live
        neighbors[7].live
        cell.update
        expect(cell.alive?).to be true
      end
    end

    describe 'rule 1' do

      it 'if cell is alive and has < 2 alive neighbors, die' do
        cell = Cell.new
        neighbors = cell.neighbors
        cell.live
        neighbors[0].die
        neighbors[1].die
        neighbors[2].die
        neighbors[3].die
        neighbors[4].die
        neighbors[5].die
        neighbors[6].die
        neighbors[7].live
        cell.update
        expect(cell.alive?).to be false
      end
    end
  end

end