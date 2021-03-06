require 'rspec'
require 'artist'
require 'festival'
require 'pry'

describe '#Artist' do
  
  before(:each) do
    Stage.clear()
    Artist.clear()
    @stage =Stage.new("north stage", nil)
    @stage.save()
  end

  describe('#==') do
    it("is the same artist if it has the same attributes as another artist") do
      artist = Artist.new("Gwar", @stage.id, nil)
      artist2 = Artist.new("Gwar", @stage.id, nil)
      expect(artist).to(eq(artist2))
    end
  end

  describe('.all') do
    it("return a list of all artists") do
      artist = Artist.new("Gwar", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("The Baby Lottery", @stage.id, nil)
      artist2.save()
      expect(Artist.all).to(eq([artist,artist2]))
    end
  end
  
  describe('.clear') do
    it("clear all artists") do
      artist = Artist.new("Gwar", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("The Baby Lottery", @stage.id, nil)
      artist2.save()
      Artist.clear()
      expect(Artist.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a artist") do
      artist = Artist.new("Gwar", @stage.id, nil)
      artist.save()
      expect(Artist.all).to(eq([artist]))
    end
  end

  describe(".find") do
    it("finds a song by id") do
      artist = Artist.new("Gwar", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("The Baby Lottery", @stage.id, nil)
      artist2.save()
      expect(Artist.find(artist.id)).to(eq(artist))
    end
  end

  describe("#update") do
    it("updates an artist by id") do
      artist = Artist.new("Gwar", @stage.id, nil)
      artist.save()
      artist.update("Undergang", @stage.id)
      expect(artist.name).to(eq("Undergang"))
    end
  end
  
  describe('#delete') do
  it("deletes an artist by id") do
    artist = Artist.new("Gwar", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("The Baby Lottery", @stage.id, nil)
      artist2.save()
      artist.delete()
      expect(Artist.all).to(eq([artist2]))
    end
  end

  describe('.find_by_stage') do
    it("find artists by stage") do
      stage2 = Stage.new("west stage", nil)
      stage2.save()
      artist = Artist.new("Gwar", @stage.id, nil)
      artist.save()
      artist2 = Artist.new("The Baby Lottery", stage2.id, nil)
      artist2.save()
      artist3 = Artist.new("Jungle Rot", stage2.id, nil)
      artist3.save()
      expect(Artist.find_by_stage(stage2.id)).to(eq([artist2, artist3]))
    end
  end

  describe("#stage") do
    it("finds the stage an artist belongs to") do
      artist = Artist.new("Gwar", @stage.id, nil)
      artist.save()
      expect(artist.stage()).to(eq(@stage))
    end
  end

  
end