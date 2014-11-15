require './model/code_retreat'
RSpec.describe CodeRetreat do
  describe '#happy' do
    it "encourages happy coding through TDD/BDD" do
      cr = CodeRetreat.new
      expect(cr.to_s).to include "Be Happy!"
    end
  end
end