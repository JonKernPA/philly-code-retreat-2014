require './model/cell'
RSpec.describe Cell do
  # each cell is in one of two possible states, alive or dead.
  describe '#alive?' do
    it "is alive by default" do
      cell = Cell.new
      expect(cell.alive?).to be true
    end
  end
  describe '#dead?' do
    it "is dead" do
      cell = Cell.new
      cell.die
      expect(cell.alive?).to be false
    end
  end

  context 'Neighbors' do
    it 'has 8 neighbors' do
      cell = Cell.new
      expect(cell.neighbors.count).to eq(8)
    end

    # 1. Any live cell with less than two live neighbours dies, as if caused by under-population.
    it 'should be dead for 8 dead neighbors' do
      cell = Cell.new
      cell.neighbors.each do |c|
        c.die
      end
      cell.update
      expect(cell.alive?).to be false
    end

    # 2. Any live cell with two or three live neighbours lives on to the next generation.
    it 'should live with 2-3 live neighbors' do
      cell = Cell.new
      cell.neighbors.each do |c|
        c.die
      end
      cell.neighbors[0].live
      cell.neighbors[1].live

      cell.update
      expect(cell.alive?).to be true
    end
    # 3. Any live cell with more than three live neighbours dies, as if by overcrowding
    it 'should die with 4 live neighbors' do
          cell = Cell.new
          cell.neighbors.each do |c|
            c.die
          end
          cell.neighbors[0].live
          cell.neighbors[1].live
          cell.neighbors[2].live
          cell.neighbors[3].live

          cell.update
          expect(cell.alive?).to be false
        end

  end
end