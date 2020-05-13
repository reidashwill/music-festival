require 'rspec'
require 'festival'
require 'pry'

describe '#Stage' do

before(:each) do
  Stage.clear()
end
  
  describe('#save') do
    it("saves a stage") do
      stage = Stage.new("west stage", nil)
      stage.save()
      stage2 = Stage.new("north stage", nil)
      stage2.save()
      expect(Stage.all).to(eq([stage, stage2]))
    end
  end

  describe('.all') do
    it("returns an empty array when there are no stages") do
      expect(Stage.all).to(eq([]))
    end
  end

end
