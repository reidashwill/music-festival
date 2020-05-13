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

  describe('.clear') do
    it("clears all stages") do
      stage = Stage.new("west stage", nil)
      stage.save()
      stage2 =Stage.new("north stage", nil)
      stage2.save()
      Stage.clear()
      expect(Stage.all).to(eq([]))
    end 
  end

  describe('#==') do
    it("is the same stage if it has the same attributes as another stage") do
      stage1 = Stage.new("east stage", nil)
      stage1.save()
      stage2 = Stage.new("east stage", nil)
      stage2.save()
      expect(stage1).to(eq(stage2))
    end
  end
  
  describe("#update") do
    it("updates a stage by id") do
      stage = Stage.new("west stage", nil)
      stage.save()
      stage.update("south stage")
      expect(stage.name).to(eq("south stage"))
    end
  end
 

end
