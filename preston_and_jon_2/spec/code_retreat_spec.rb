require './model/world'
require './model/cell'
RSpec.describe World do

  describe '#alive_count' do
    it 'returns 0 for a new World' do
      world = World.new

      expect(world.alive_count).to eq 0
    end

    it 'returns 1 for world with one live cell' do
      world = World.new
      cell = Cell.new(true)
      world.add_cell(cell)
      expect(world.alive_count).to eq 1
    end

    it 'returns 0 after next_generation when only one cell is alive :)' do
      world = World.new
      cell = Cell.new(true)
      dead_cell = Cell.new(false)

      world.add_cell(cell)
      world.add_cell(dead_cell)

      world.next_generation

      expect(world.alive_count).to eq 0
    end
  end

  describe '#next_generation' do
    context 'under populated' do

    end
  end


end

RSpec.describe Cell do
  describe '#alive?' do
    it 'should be alive' do
      cell = Cell.new(true)
      expect(cell.alive?).to be true
    end
  end
end