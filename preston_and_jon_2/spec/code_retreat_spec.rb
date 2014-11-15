require './model/world'
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
  end

end