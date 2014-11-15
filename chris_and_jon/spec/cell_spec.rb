require './model/cell'
RSpec.describe Cell do
  describe '#alive?' do
    it "cell is alive by default" do
      cell = Cell.new
      expect(cell.alive?).to be true
    end
  end

  describe 'dead' do
    it "cell can be dead" do
      cell = Cell.new
      cell.state(false)
      expect(cell.alive?).to be false
    end
  end

  describe '#state' do
    it "cell value is set" do
      cell = Cell.new
      cell.state(true)
      expect(cell.alive?).to be true
    end
  end
end