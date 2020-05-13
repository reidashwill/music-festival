class Stage

  attr_reader :id
  attr_accessor :name
  @@total_rows = 0
  @@stages = {}

  def initialize(name, id)
    @name = name
    @id = id || @@total_rows += 1
  end
  
  def self.all
    @@stages.values()
  end  
      
  def save
    @@stages[self.id] = Stage.new(self.name, self.id)
  end
    
  def ==(stage_to_compare)
    self.name() == stage_to_compare.name()
  end

  def self.clear
    @@stages = {}
    @@total_rows = 0
  end

  def update(name)
    self.name = name
    @@stages[self.id] = Stage.new(self.name, self.id)
  end

  def self.find(id)
    @@stages[id]
  end
  
  def delete
    @@stages.delete(self.id)
  end

  # # def self.search(name)
  # #   self.all.select{| album | album.name.include?(name.downcase)}
  # # end

  # def self.search(name)
  #   album_names = Album.all.map {|a| a.name }
  #   result = []
  #   names = album_names.grep(/#{name}/)
  #   names.each do |n| 
  #     display_albums = Album.all.select {|a| a.name == n}
  #     result.push(display_albums)
  #   end
  #   result
  # end

end