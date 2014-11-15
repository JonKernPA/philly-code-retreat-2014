require './model/cell'
RSpec.describe Cell do
  describe '#alive?' do
    it "cell is alive by default" do
      cell = Cell.new
      expect(cell.alive?).to be true
    end
  end
end