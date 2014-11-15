require './model/world'
require './model/cell'
RSpec.describe World do
  it 'is a 2D world of rows and columns' do
    world = World.new
    expect(world.num_rows).to be > 0
    expect(world.num_cols).to be > 0
  end

  it 'has cells at given 2D coordinates' do
    world = World.new
    expect(world.cell(3,4)).to_not be_nil
  end


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

    it 'reproduces only when there are three live neighbors' do
      world = World.new
      world.add_cell(Cell.new(true), [0,0])
      world.add_cell(Cell.new(true), [0,1])
      world.add_cell(Cell.new(true), [1,0])
      world.add_cell(Cell.new(false), [1,1])

      world.next_generation

      expect(world.alive_count).to eq 4
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